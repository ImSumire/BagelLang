# Flags
CXX = g++
CXXFLAGS = -std=c++17 -Wno-unused-but-set-variable
LDFLAGS =
OPTI = g

# Source
SRC = src/main.cpp

# Target
TARGET_DIR = dist
TARGET = $(TARGET_DIR)/bagel

# Colors
RESET = \033[0m
SUCC = \033[42;1m ✔ $(RESET)
INFO = \033[44;1m i $(RESET)
COMM = \033[45;1m > $(RESET)

# Humanize size
define humanize_size
	$(shell du -h $(TARGET) | cut -f1)
endef

# Compilation
$(TARGET): $(SRC)
	@echo "$(INFO) Compiling $(SRC)"
	@mkdir -p $(TARGET_DIR)
	@printf "$(COMM) "
	$(CXX) -O$(OPTI) $(CXXFLAGS) -o $(TARGET) $(SRC) $(LDFLAGS)
	@if [ $$? -eq 0 ]; then \
	    echo "$(SUCC) Sources compiled"; \
	    echo "$(INFO) Size of binary: $$(du -h $(TARGET) | cut -f1)"; \
	fi

# Utils
.PHONY: clean run

clean:
	rm -rf $(TARGET_DIR)

run:
	$(TARGET)
