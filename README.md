<h1 align="center">Graph Understand for Claude Code</h1>

<p align="center">
  <strong>Biến bất kỳ codebase, knowledge base hay tài liệu nào thành một đồ thị tri thức (knowledge graph) tương tác — để bạn khám phá, tìm kiếm và đặt câu hỏi trực tiếp trên đó.</strong>
  <br />
  <em>Được xây dựng riêng cho <a href="https://code.claude.com/docs/en/plugins-reference#plugins-reference">Claude Code</a>.</em>
</p>

<p align="center">
  <strong>Đừng đọc code một cách mù mờ. Hãy nhìn thấy bức tranh tổng thể.</strong>
</p>

<p align="center">
  🇻🇳 Tiếng Việt | <a href="READMEs/README.en.md">🇬🇧 English</a>
</p>

<p align="center">
  <a href="#-bắt-đầu-nhanh"><img src="https://img.shields.io/badge/Bắt_đầu_nhanh-blue" alt="Bắt đầu nhanh" /></a>
  <a href="https://github.com/huycoder2103/Graph-Understanf-for-claudeCodeCLI/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-MIT-yellow" alt="License: MIT" /></a>
  <a href="https://docs.anthropic.com/en/docs/claude-code"><img src="https://img.shields.io/badge/Claude_Code-8A2BE2" alt="Claude Code" /></a>
</p>

<p align="center">
  <img src="assets/hero.png" alt="Graph Understand for Claude Code — biến codebase thành đồ thị tri thức tương tác" width="800" />
</p>

<p align="center">
  <strong>Được phát triển và tùy biến bởi <a href="https://github.com/huycoder2103">huycoder2103</a></strong>
  <br />
  <em>Dựa trên dự án mã nguồn mở <a href="https://github.com/Egonex-AI/Understand-Anything">Understand Anything</a> của <a href="https://github.com/Egonex-AI">Egonex</a>, được khởi tạo bởi <a href="https://github.com/Lum1104">Lum1104</a>. Bản này được tối giản để tập trung hoàn toàn vào Claude Code.</em>
</p>

---

**Bạn vừa gia nhập một team mới. Codebase có 200.000 dòng code. Bạn bắt đầu từ đâu?**

Đây là một [Claude Code Plugin](https://code.claude.com/docs/en/plugins-reference#plugins-reference) phân tích dự án của bạn bằng một pipeline đa tác tử (multi-agent), dựng nên một đồ thị tri thức gồm mọi file, hàm, class và dependency, rồi cho bạn một dashboard tương tác để khám phá tất cả bằng hình ảnh. Ngừng đọc code một cách mù mờ. Bắt đầu nhìn thấy bức tranh lớn.

> **Mục tiêu không phải một đồ thị khiến bạn choáng ngợp vì codebase phức tạp cỡ nào — mà là một đồ thị âm thầm dạy bạn hiểu từng mảnh ghép khớp với nhau ra sao.**

---

## ✨ Tính năng

### Khám phá đồ thị cấu trúc

Điều hướng codebase như một đồ thị tri thức tương tác — mỗi file, hàm và class là một node có thể click, tìm kiếm và khám phá. Chọn bất kỳ node nào để xem tóm tắt bằng ngôn ngữ đời thường, các mối quan hệ và tour hướng dẫn.

### Hiểu logic nghiệp vụ

Chuyển sang chế độ domain và xem code của bạn ánh xạ vào các quy trình nghiệp vụ thực tế ra sao — domain, luồng (flow) và các bước (step) được bố trí thành một đồ thị ngang.

### Phân tích knowledge base

Trỏ `/understand-knowledge` vào một [LLM wiki theo mẫu Karpathy](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) để nhận một đồ thị tri thức force-directed với gom cụm cộng đồng (community clustering). Bộ parser tất định trích xuất wikilink và category từ `index.md`, sau đó các agent LLM khám phá các quan hệ ngầm, trích xuất thực thể và nêu bật các luận điểm — biến wiki của bạn thành một đồ thị các ý tưởng liên kết với nhau.

<table>
  <tr>
    <td width="50%" valign="top">
      <h3>🧭 Tour hướng dẫn</h3>
      <p>Các bài hướng dẫn tự động về kiến trúc, sắp xếp theo thứ tự phụ thuộc. Học codebase theo đúng trình tự.</p>
    </td>
    <td width="50%" valign="top">
      <h3>🔍 Tìm kiếm mờ & ngữ nghĩa</h3>
      <p>Tìm mọi thứ theo tên hoặc theo ý nghĩa. Gõ "phần nào xử lý auth?" và nhận kết quả liên quan trên toàn đồ thị.</p>
    </td>
  </tr>
  <tr>
    <td width="50%" valign="top">
      <h3>📊 Phân tích tác động của thay đổi</h3>
      <p>Xem những phần nào của hệ thống bị ảnh hưởng bởi thay đổi của bạn trước khi commit. Hiểu hiệu ứng lan tỏa khắp codebase.</p>
    </td>
    <td width="50%" valign="top">
      <h3>🎭 Giao diện thích ứng theo vai trò</h3>
      <p>Dashboard tự điều chỉnh mức độ chi tiết theo người dùng — dev junior, PM hay power user.</p>
    </td>
  </tr>
  <tr>
    <td width="50%" valign="top">
      <h3>🏗️ Trực quan hóa theo tầng</h3>
      <p>Tự động gom nhóm theo tầng kiến trúc — API, Service, Data, UI, Utility — kèm chú thích màu.</p>
    </td>
    <td width="50%" valign="top">
      <h3>📚 Khái niệm ngôn ngữ</h3>
      <p>12 mẫu lập trình (generics, closures, decorators, v.v.) được giải thích ngay trong ngữ cảnh nơi chúng xuất hiện.</p>
    </td>
  </tr>
</table>

---

## 🚀 Bắt đầu nhanh

### 1. Cài plugin

```bash
/plugin marketplace add huycoder2103/Graph-Understanf-for-claudeCodeCLI
/plugin install understand-anything
```

> **Dùng model local?** Với các thiết lập ưu tiên quyền riêng tư hoặc doanh nghiệp, bạn có thể trỏ Claude Code sang một model provider local như [Ollama](https://docs.ollama.com/integrations) — làm theo hướng dẫn tích hợp của họ để đổi model provider.

### 2. Phân tích codebase

```bash
/understand
```

Một pipeline đa tác tử quét dự án, trích xuất mọi file, hàm, class và dependency, rồi dựng đồ thị tri thức lưu vào `.ua/knowledge-graph.json`. (Các dự án đã có sẵn thư mục `.understand-anything/` sẽ tiếp tục dùng thư mục đó — không cần migrate gì cả.)

> **Lưu ý về token:** Lần chạy `/understand` đầu tiên phân tích toàn bộ codebase và có thể tốn khá nhiều token với dự án lớn. Nên chạy nó bằng gói/subscription theo token, hoặc dùng model local (xem trên) cho bước khởi tạo. Các lần chạy sau mặc định là tăng dần (incremental) — chỉ phân tích lại file đã thay đổi — nên tốn ít token hơn nhiều.

**Xuất kết quả theo ngôn ngữ:** Dùng `--language` để tạo nội dung theo ngôn ngữ bạn muốn:

```bash
# Tạo nội dung tiếng Việt cho node và giao diện Dashboard (nếu được hỗ trợ)
/understand --language vi

# Các ngôn ngữ hỗ trợ: en (mặc định), zh, zh-TW, ja, ko, ru
```

Ở **lần chạy đầu tiên** trong một dự án — khi bạn không truyền `--language` và chưa có ngôn ngữ nào được lưu — `/understand` sẽ phát hiện ngôn ngữ bạn đang trò chuyện. Nếu không phải tiếng Anh, nó sẽ hỏi để bạn xác nhận (hoặc ghi đè) trước khi tạo. Lựa chọn của bạn được lưu vào `.ua/config.json` và tái sử dụng ở mọi lần chạy sau.

Tham số `--language` ảnh hưởng đến:
- Tóm tắt và mô tả node trong đồ thị tri thức
- Nhãn, nút bấm và tooltip trên Dashboard
- Phần giải thích trong các tour hướng dẫn

### 3. Khám phá dashboard

```bash
/understand-dashboard
```

Một dashboard web tương tác mở ra với codebase được trực quan hóa thành đồ thị — tô màu theo tầng kiến trúc, có thể tìm kiếm và click. Chọn bất kỳ node nào để xem code, mối quan hệ và phần giải thích bằng ngôn ngữ đời thường.

### 4. Tiếp tục học

```bash
# Hỏi bất cứ điều gì về codebase
/understand-chat Luồng thanh toán hoạt động thế nào?

# Phân tích tác động của các thay đổi hiện tại
/understand-diff

# Đào sâu vào một file hoặc hàm cụ thể
/understand-explain src/auth/login.ts

# Tạo hướng dẫn onboarding cho thành viên mới
/understand-onboard

# Trích xuất tri thức nghiệp vụ (domain, flow, step)
/understand-domain

# Phân tích một LLM wiki theo mẫu Karpathy
/understand-knowledge ~/path/to/wiki

# Chạy lại bất cứ lúc nào — mặc định tăng dần (chỉ phân tích lại file đã đổi)
/understand

# Tự động cập nhật sau mỗi commit qua post-commit hook
/understand --auto-update

# Giới hạn phạm vi vào một thư mục con (cho monorepo lớn)
/understand src/frontend
```

---

## 🔌 Cài đặt trên Claude Code

```bash
/plugin marketplace add huycoder2103/Graph-Understanf-for-claudeCodeCLI
/plugin install understand-anything
```

Sau khi cài, khởi động lại Claude Code nếu cần rồi chạy `/understand` trong dự án của bạn.

> **Yêu cầu:** Node.js >= 22 và pnpm >= 10 nếu bạn muốn build từ mã nguồn (xem `CLAUDE.md`). Để chỉ dùng plugin thì chỉ cần Claude Code.

---

## 📦 Chia sẻ đồ thị với cả team

Đồ thị chỉ là JSON — **commit một lần, cả team bỏ qua được bước chạy pipeline**. Rất hợp cho onboarding, review PR và docs-as-code.

**Nên commit gì:** mọi thứ trong `.ua/` *ngoại trừ* `intermediate/` và `diff-overlay.json` (đó là file nháp cục bộ). (Dự án cũ dùng `.understand-anything/` — thay tên thư mục tương ứng bên dưới nếu đó là thư mục đang có.)

```gitignore
.ua/intermediate/
.ua/diff-overlay.json
```

**Giữ đồ thị luôn mới:** bật `/understand --auto-update` — một post-commit hook sẽ vá đồ thị theo kiểu tăng dần để mỗi commit đi kèm một đồ thị khớp. Hoặc chạy lại `/understand` thủ công trước mỗi lần release.

**Đồ thị lớn (10 MB+):** theo dõi bằng **git-lfs**.

```bash
git lfs install
git lfs track ".ua/*.json"
git add .gitattributes .ua/
```

### Xem dashboard mà không cần Claude Code

Sau khi một đồ thị đã được tạo và commit, bất kỳ ai trong team cũng có thể mở nó bằng một lệnh — không cần Claude Code, không LLM, không API key. Chỉ cần Node.js (>= 18):

```bash
npx https://github.com/huycoder2103/Graph-Understanf-for-claudeCodeCLI/releases/latest/download/understand-anything-viewer.tgz /path/to/analyzed/project
```

Terminal sẽ in ra một URL có token (`http://127.0.0.1:5173/?token=…`) và mở dashboard tương tác đầy đủ trong trình duyệt. Thư mục dự án (mặc định: thư mục hiện tại) phải chứa thư mục dữ liệu đã commit (`.ua/`, hoặc `.understand-anything/` cũ). Mọi thứ được phục vụ chỉ-đọc từ ổ đĩa cục bộ — không có lời gọi LLM, không có dữ liệu nào rời khỏi máy bạn.

Làm việc từ một bản clone? `pnpm install && pnpm --filter @understand-anything/core build`, rồi `GRAPH_DIR=/path/to/analyzed/project pnpm dev:dashboard` cho kết quả tương tự qua Vite dev server.

---

## 🔧 Bên dưới nắp capô

### Kết hợp Tree-sitter + LLM

Phân tích tĩnh và LLM làm đúng thế mạnh của mỗi bên:

- **Tree-sitter (tất định)** — parse mã nguồn thành cây cú pháp cụ thể và trích xuất các sự kiện cấu trúc: import, export, định nghĩa hàm/class, call site, kế thừa. Được giải quyết sẵn thành một `importMap` trong pha quét và truyền cho các file-analyzer để chúng không phải suy ra lại import từ mã nguồn. Cùng đầu vào → cùng đầu ra, mọi lần chạy. Cũng là nền tảng cho phát hiện thay đổi dựa trên fingerprint phục vụ cập nhật tăng dần.
- **LLM (ngữ nghĩa)** — đọc cấu trúc đã parse cùng với mã nguồn gốc để tạo ra thứ parser không làm được: tóm tắt bằng ngôn ngữ đời thường, tag, gán tầng kiến trúc, ánh xạ domain nghiệp vụ, tour hướng dẫn, chú thích khái niệm ngôn ngữ.

Sự phân chia này là lý do đồ thị có tính tái lập ở phần cấu trúc (cùng một đoạn code luôn cho ra cùng các cạnh) trong khi vẫn nắm bắt được ý định ở phần ngữ nghĩa (một file *để làm gì*, chứ không chỉ nó import gì).

### Pipeline đa tác tử

Lệnh `/understand` điều phối 5 agent chuyên biệt, và `/understand-domain` bổ sung agent thứ 6:

| Agent | Vai trò |
|-------|---------|
| `project-scanner` | Phát hiện file, nhận diện ngôn ngữ và framework |
| `file-analyzer` | Trích xuất hàm, class, import; tạo node và cạnh cho đồ thị |
| `architecture-analyzer` | Nhận diện các tầng kiến trúc |
| `tour-builder` | Tạo các tour học tập có hướng dẫn |
| `graph-reviewer` | Kiểm tra tính đầy đủ và toàn vẹn tham chiếu của đồ thị (mặc định chạy inline; dùng `--review` để LLM review đầy đủ) |
| `domain-analyzer` | Trích xuất domain nghiệp vụ, flow và các bước quy trình (dùng bởi `/understand-domain`) |
| `article-analyzer` | Trích xuất thực thể, luận điểm và quan hệ ngầm từ bài wiki (dùng bởi `/understand-knowledge`) |

Các file-analyzer chạy song song (tối đa 5 đồng thời, 20-30 file mỗi batch). Hỗ trợ cập nhật tăng dần — chỉ phân tích lại file đã thay đổi kể từ lần chạy trước.

---

## 🤝 Đóng góp

Rất hoan nghênh đóng góp! Cách bắt đầu:

1. Fork repository
2. Tạo nhánh tính năng (`git checkout -b feature/my-feature`)
3. Chạy test (`pnpm --filter @understand-anything/core test`)
4. Commit thay đổi và mở pull request

Vui lòng mở issue trước cho các thay đổi lớn để cùng thảo luận hướng tiếp cận.

---

<p align="center">
  <strong>Ngừng đọc code mù mờ. Bắt đầu hiểu mọi thứ.</strong>
</p>

<p align="center">
  Giấy phép MIT &copy; Yuxiang Lin và Infinite Universe, Inc. — bản tùy biến bởi <a href="https://github.com/huycoder2103">huycoder2103</a>.
</p>
