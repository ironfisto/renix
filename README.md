# Renix - Security Tools Development Environment

A comprehensive, reproducible security testing and development environment powered by Nix. This project provides a unified environment for various security tools, debugging utilities, and programming languages, all managed through Nix.

## � Project Structure

```
renix/
├── flake.nix           # Nix flake configuration
├── shell.nix          # Main shell configuration
└── src/
    ├── langs/         # Programming languages
    │   ├── rust.nix
    │   ├── go.nix
    │   ├── c.nix
    │   ├── java.nix
    │   ├── scala.nix
    │   ├── ruby.nix
    │   ├── zig.nix
    │   └── python.nix
    └── recon/         # Security & Reconnaissance tools
        ├── nmap.nix
        ├── sqlmap.nix
        ├── ffuf.nix
        ├── amass.nix
        ├── gdb.nix
        ├── lldb.nix
        └── metasploit.nix

- **Modular Configuration:** Each language has its own configuration file in `src/`, making it easy to customize or extend
- **Reproducible:** Uses Nix flakes for reproducible builds and development environments
- **Isolated:** Keep your system clean by having all development tools contained in the Nix shell

## �️ Available Tools

### Security & Reconnaissance Tools
- **Nmap**: Network discovery and security scanning
- **SQLmap**: Automatic SQL injection and database takeover
- **FFuf**: Fast web fuzzer
- **Amass**: In-depth Attack Surface Mapping
- **Metasploit**: Penetration testing framework
- **GDB/LLDB**: Powerful debugging tools

### Programming Languages & Tools
- **Rust**: Systems programming with cargo and rust-analyzer
- **Go**: Modern programming with proper GOPATH setup
- **C/C++**: Development with GCC, Clang
- **Java**: JDK 17 with Maven and Gradle
- **Scala**: With SBT configuration
- **Ruby**: With Bundler and Solargraph
- **Zig**: Systems programming
- **Python**: Python 3 with pip and virtualenv

## 📥 Installation

### 1. Installing Nix

#### On Linux/macOS:
```bash
# Install Nix package manager
sh <(curl -L https://nixos.org/nix/install) --daemon

# Source Nix in your shell
. ~/.nix-profile/etc/profile.d/nix.sh
```

#### Enable Flakes:
Add to `/etc/nix/nix.conf` (create if it doesn't exist):
```
experimental-features = nix-command flakes
```

### 2. Installing Renix

```bash
# Clone the repository
git clone https://github.com/ironfisto/renix.git
cd renix

# Enter the development environment
nix develop  # If using flakes (recommended)
# OR
nix-shell   # Traditional method
```

## � Usage Instructions

### Network Scanning & Enumeration

#### Nmap
```bash
# Basic scan
nmap -sV target.com

# Comprehensive scan
nmap -sC -sV -p- target.com

# Stealth scan
nmap -sS -sV target.com

# Script scan
nmap --script=vuln target.com
```

#### Amass
```bash
# Basic enumeration
amass enum -d domain.com

# Active reconnaissance
amass enum -active -d domain.com -config config.ini

# Visualization
amass viz -d3 -d domain.com
```

### Web Application Testing

#### SQLmap
```bash
# Basic injection test
sqlmap -u "http://target.com/page.php?id=1"

# With form detection
sqlmap -u "http://target.com/form" --forms

# Database enumeration
sqlmap -u "http://target.com/page.php?id=1" --dbs
```

#### FFuf
```bash
# Directory fuzzing
ffuf -w wordlist.txt -u http://target.com/FUZZ

# Virtual host discovery
ffuf -w hosts.txt -H "Host: FUZZ.target.com" -u http://target.com

# Parameter fuzzing
ffuf -w params.txt -u http://target.com/script.php?FUZZ=test
```

### Exploitation

#### Metasploit
```bash
# Start console
msfconsole

# Database setup
msfdb init

# Basic usage
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
set LHOST your_ip
exploit
```

### Debugging

#### GDB
```bash
# Start debugging
gdb ./program

# Common commands
break main
run
next
print variable
bt
```

#### LLDB
```bash
# Start debugging
lldb ./program

# Common commands
breakpoint set --name main
run
thread step-over
frame variable
bt
```

### Programming Languages

#### Go
```bash
# Initialize a new module
go mod init myproject

# Build and run
go build
go run main.go
```

#### Rust
```bash
# Create new project
cargo new myproject

# Build and run
cargo build
cargo run
```

#### Python
```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate

# Install packages
pip install requests
```

## 🔧 Configuration

### Tool Locations
- Configurations: `src/recon/`
- Language setups: `src/langs/`
- Each tool has its own .nix file for customization

### Environment Variables
All tools use appropriate environment variables for configuration:
- `GOPATH` for Go workspace
- `NMAPDIR` for Nmap scripts
- `SQLMAP_OUTPUT_DIR` for SQLmap results
- `AMASS_CONFIG` for Amass settings
- And more, check individual .nix files

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch
3. Make your changes
4. Submit a pull request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ⚠️ Disclaimer

Use these tools responsibly and only on systems you have permission to test.

### Project Structure

```
renix/
├── flake.nix           # Nix flake configuration
├── shell.nix          # Main shell configuration
└── src/
    ├── rust.nix       # Rust-specific configuration
    ├── go.nix         # Go-specific configuration
    ├── c.nix          # C/C++-specific configuration
    ├── java.nix       # Java-specific configuration
    ├── scala.nix      # Scala-specific configuration
    ├── ruby.nix       # Ruby-specific configuration
    ├── zig.nix        # Zig-specific configuration
    └── python.nix     # Python-specific configuration
```

### Customizing the Environment

1. **Adding new packages to a language:**
   Edit the corresponding language file in `src/`. For example, to add a new Python package:

   ```nix
   # src/python.nix
   { pkgs }:
   {
     packages = with pkgs; [
       python3
       python3Packages.pip
       python3Packages.virtualenv
       python3Packages.ipython
       python3Packages.pandas  # Add new packages here
     ];
     # ...
   }
   ```

2. **Adding a new language:**
   - Create a new file in `src/` (e.g., `kotlin.nix`)
   - Add the import and include it in the packages list in `shell.nix`

## 🔄 Environment Variables

Each language configuration sets up its own environment variables:

- Rust: `RUSTUP_HOME`, `CARGO_HOME`
- Go: `GOPATH`
- Java: `JAVA_HOME`
- Python: `PYTHONPATH`
- Scala: `SBT_OPTS`
- Ruby: `GEM_HOME`

## 💡 Tips

1. The environment shows available tool versions on startup
2. Each language has its own LSP (Language Server Protocol) support for better IDE integration
3. Use `exit` or `Ctrl+D` to leave the Nix shell environment
4. Updates to configuration files require restarting the Nix shell

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details