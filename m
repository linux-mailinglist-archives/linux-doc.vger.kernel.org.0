Return-Path: <linux-doc+bounces-14901-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7FE8AE795
	for <lists+linux-doc@lfdr.de>; Tue, 23 Apr 2024 15:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5DC82880F7
	for <lists+linux-doc@lfdr.de>; Tue, 23 Apr 2024 13:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B731353E1;
	Tue, 23 Apr 2024 13:09:44 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46433134CC2;
	Tue, 23 Apr 2024 13:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713877784; cv=none; b=YQz9Kwczcv0jgSdOlXTXmb0cslLV9ZkYsAQUN1uLxRyui97SRqunXOVZ8FF4tC1AgPcHqOqplKIBUJ11XnZTXsKaiYINjr05HbOmOeHabmhg5ctVuzUjLKa8bogA+XPsAkUI9+DsnDNaDEmhMwCgRGPdeolq+8eQ+rfS8H/1Xi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713877784; c=relaxed/simple;
	bh=GaSMvxmMOp8Eji2z5Xo8ZYQH5edYvjro7N4Lgxz2XG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HPY/1leGSDxCrWGF8TSbPKnYsPgQfd+f/9EWqkFwzR9BvsUijRLXlKbVj4l/WIePF9Wa+iz0fJMTof+QArhTZUpdRO7olK4/lGDIBFLUuOneMLt+ezZS59jZIDqR6YmgVUozfdQGJnfHf/Ost3O6E1wM4glMN0ImxzsHsfjJRQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8DxNvATsydmk2QBAA--.7904S3;
	Tue, 23 Apr 2024 21:09:39 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxjlcJsydma18CAA--.4989S3;
	Tue, 23 Apr 2024 21:09:35 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: ojeda@kernel.org,
	corbet@lwn.net,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	alexs@kernel.org,
	dzm91@hust.edu.cn
Cc: Yanteng Si <siyanteng@loongson.cn>,
	linux-doc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v1 4/4] docs/zh_CN/rust: Update the translation of quick-start to 6.9-rc4
Date: Tue, 23 Apr 2024 21:09:27 +0800
Message-Id: <66e558a12ef06704c683863d28b4d3c6bf7efa79.1713875158.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1713875158.git.siyanteng@loongson.cn>
References: <cover.1713875158.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxjlcJsydma18CAA--.4989S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Ar18Kry3Ww18Xw1kKFWfWFX_yoW7ZryDpF
	yqkr93ur4xAFy8ZryIkFyUuF15Ca95Z342q3WDJa42krs5Jr4kKw4Iyry3Ca17ZayxArW2
	gF18Zryj9rsakFbCm3ZEXasCq-sJn29KB7ZKAUJUUUUk529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Cr1j6rxdM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWr
	XVW3AwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUaYFADUUUU

Update to commit 711cbfc71765 ("docs: rust: Clarify that 'rustup
override' applies to build directory")
commit 7583ce66ddf7 ("docs: rust: remove `CC=clang` mentions")
commit 2285eb2f2429 ("docs: rust: clarify what 'rustup override' does")
commit 8cb40124cf92 ("docs: rust: update instructions for obtaining
'core' source")
commit b603c6cc405a ("docs: rust: add command line to rust-analyzer
section")
commit 08ab786556ff ("rust: bindgen: upgrade to 0.65.1")
commit eae90172c5b8 ("docs: rust: add paragraph about finding a
suitable `libclang`")
commit 6883b29c6cae ("docs: rust: point directly to the standalone
installers")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/rust/quick-start.rst   | 50 +++++++++++++------
 1 file changed, 34 insertions(+), 16 deletions(-)

diff --git a/Documentation/translations/zh_CN/rust/quick-start.rst b/Documentation/translations/zh_CN/rust/quick-start.rst
index a4b8e8a50a89..8616556ae4d7 100644
--- a/Documentation/translations/zh_CN/rust/quick-start.rst
+++ b/Documentation/translations/zh_CN/rust/quick-start.rst
@@ -37,13 +37,18 @@ rustc
 需要一个特定版本的Rust编译器。较新的版本可能会也可能不会工作，因为就目前而言，内核依赖
 于一些不稳定的Rust特性。
 
-如果使用的是 ``rustup`` ，请进入检出的源代码目录并运行::
+如果使用的是 ``rustup`` ，请进入内核编译目录（或者用 ``--path=<build-dir>`` 参数
+来 ``设置`` sub-command)并运行::
 
 	rustup override set $(scripts/min-tool-version.sh rustc)
 
-或者从以下网址获取一个独立的安装程序或安装 ``rustup`` ：
++这将配置你的工作目录使用正确版本的 ``rustc``，而不影响你的默认工具链。
 
-	https://www.rust-lang.org
+请注意覆盖应用当前的工作目录（和它的子目录）。
+
+如果你使用 ``rustup``， 可以从下面的链接拉取一个单独的安装程序:
+
+	https://forge.rust-lang.org/infra/other-installation-methods.html#standalone
 
 
 Rust标准库源代码
@@ -57,21 +62,23 @@ Rust标准库的源代码是必需的，因为构建系统会交叉编译 ``core
 
 这些组件是按工具链安装的，因此以后升级Rust编译器版本需要重新添加组件。
 
-否则，如果使用独立的安装程序，可以将Rust仓库克隆到工具链的安装文件夹中::
+否则，如果使用独立的安装程序，可以将Rust源码树下载到安装工具链的文件夹中::
 
-	git clone --recurse-submodules \
-		--branch $(scripts/min-tool-version.sh rustc) \
-		https://github.com/rust-lang/rust \
-		$(rustc --print sysroot)/lib/rustlib/src/rust
+       curl -L "https://static.rust-lang.org/dist/rust-src-$(scripts/min-tool-version.sh rustc).tar.gz" |
+               tar -xzf - -C "$(rustc --print sysroot)/lib" \
+               "rust-src-$(scripts/min-tool-version.sh rustc)/rust-src/lib/" \
+               --strip-components=3
 
-在这种情况下，以后升级Rust编译器版本需要手动更新这个克隆的仓库。
+在这种情况下，以后升级Rust编译器版本需要手动更新这个源代码树（这可以通过移除
+``$(rustc --print sysroot)/lib/rustlib/src/rust`` ，然后重新执行上
+面的命令做到）。
 
 
 libclang
 ********
 
 ``bindgen`` 使用 ``libclang`` （LLVM的一部分）来理解内核中的C代码，这意味着需要安
-装LLVM；同在开启 ``CC=clang`` 或 ``LLVM=1`` 时编译内核一样。
+装LLVM；同在开启``LLVM=1`` 时编译内核一样。
 
 Linux发行版中可能会有合适的包，所以最好先检查一下。
 
@@ -94,7 +101,20 @@ bindgen
 
 通过以下方式安装它（注意，这将从源码下载并构建该工具）::
 
-	cargo install --locked --version $(scripts/min-tool-version.sh bindgen) bindgen
+	cargo install --locked --version $(scripts/min-tool-version.sh bindgen) bindgen-cli
+
+``bindgen`` 需要找到合适的 ``libclang`` 才能工作。如果没有找到（或者找到的
+``libclang`` 与应该使用的 ``libclang`` 不同），则可以使用 ``clang-sys``
+理解的环境变量（Rust绑定创建的 ``bindgen`` 用来访问 ``libclang``）:
+
+
+* ``LLVM_CONFIG_PATH`` 可以指向一个 ``llvm-config`` 可执行文件。
+
+* 或者 ``LIBCLANG_PATH`` 可以指向 ``libclang`` 共享库或包含它的目录。
+
+* 或者 ``CLANG_PATH`` 可以指向 ``clang`` 可执行文件。
+
+详情请参阅 ``clang-sys`` 的文档:
 
 
 开发依赖
@@ -163,7 +183,9 @@ rust-analyzer
 一起使用，以实现语法高亮、补全、转到定义和其他功能。
 
 ``rust-analyzer`` 需要一个配置文件， ``rust-project.json``, 它可以由 ``rust-analyzer``
-Make 目标生成。
+Make 目标生成::
+
+       make LLVM=1 rust-analyzer
 
 
 配置
@@ -189,10 +211,6 @@ Rust支持（CONFIG_RUST）需要在 ``General setup`` 菜单中启用。在其
 
 	make LLVM=1
 
-对于不支持完整LLVM工具链的架构，使用::
-
-	make CC=clang
-
 使用GCC对某些配置也是可行的，但目前它是非常试验性的。
 
 
-- 
2.31.4


