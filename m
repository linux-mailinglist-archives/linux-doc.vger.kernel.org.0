Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27E6714355
	for <lists+linux-doc@lfdr.de>; Mon,  6 May 2019 03:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbfEFBfI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 5 May 2019 21:35:08 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34160 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbfEFBfI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 May 2019 21:35:08 -0400
Received: by mail-pg1-f194.google.com with SMTP id c13so5652125pgt.1
        for <linux-doc@vger.kernel.org>; Sun, 05 May 2019 18:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1bZS6QNu3Og8dmYIBYZs/QPsWGTr16uK5TDgJ7mlBd8=;
        b=oFoSAFGkkSQZQTESShUDzd5h4YLrcvOJdgh2qNjtweZWVbz4UktLQhSdeAspAMd9U/
         9NJgdIdcsPyU/TTbjbkYnrhMgXTxjumbAEVOlaUk9ApBJvgVUtSIB3BOrRpc9Ku/Z4Zz
         zpRlsjxL8HyX0+HAb4Qa9MLSm7jH8m2SJUKE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1bZS6QNu3Og8dmYIBYZs/QPsWGTr16uK5TDgJ7mlBd8=;
        b=JKRXesCaqGFFqHY1tjrkx2zZoogagIQZEz+5tU1rTYLtg0l1NIvrYWMDFSpfxG2+Rf
         T2XpSPrG/vhuXdGYV4XfELdbWckYO2Nx/uMbCCVb0hLZ3UTg6qKpC15BNvcyeqaeK+Cr
         WoK5L4C9TVw9Xz5VxBb+FOZYh8b2nmXUDxCWSlNZx2wpiHt8eKPvF3jWkxjabXQ0CvLQ
         qQr21+Lf4evIOPkoaPSP4D/kv6zJQGgmMR2bVIORT9jJUzYoAzqwxpA1a6HEEqIH0lRP
         Lxqb76M893oMBkDn9uea4XUamVRLKtmLqkKBP4xnEPtW9m3KdUMw111ETd7/IFpBYVwr
         r+vg==
X-Gm-Message-State: APjAAAULvbh1F79yiGCjPC/bEkfsTdlhrTxu92OeD/CO0Oa3cjKsXR0c
        PD1RFkKr+2niyVdIDHZ1tfo7Gg==
X-Google-Smtp-Source: APXvYqyMqjH1rv8o1a5MG6lttWXnrtTTnVkW2pdmDmafQmbF4Z2cWekbCd1pLswsBkrlxyLONtca4g==
X-Received: by 2002:a62:46c7:: with SMTP id o68mr30726847pfi.54.1557106507313;
        Sun, 05 May 2019 18:35:07 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id m131sm15649677pga.3.2019.05.05.18.35.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 05 May 2019 18:35:05 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>, atishp04@gmail.com,
        bpf@vger.kernel.org, Brendan Gregg <bgregg@netflix.com>,
        Brendan Gregg <brendan.d.gregg@gmail.com>, dancol@google.com,
        Daniel Borkmann <daniel@iogearbox.net>,
        Dan Williams <dan.j.williams@intel.com>,
        dietmar.eggemann@arm.com, duyuchao <yuchao.du@unisoc.com>,
        gregkh@linuxfoundation.org, Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Karim Yaghmour <karim.yaghmour@opersys.com>,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-trace-devel@vger.kernel.org,
        Manjo Raja Rao <linux@manojrajarao.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        =?UTF-8?q?Micha=C5=82=20Gregorczyk?= <michalgr@fb.com>,
        Michal Gregorczyk <michalgr@live.com>,
        Mohammad Husain <russoue@gmail.com>,
        Olof Johansson <olof@lixom.net>, qais.yousef@arm.com,
        rdunlap@infradead.org, Shuah Khan <shuah@kernel.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Tamir Carmeli <carmeli.tamir@gmail.com>, yhs@fb.com
Subject: [PATCH v3] kheaders: Move from proc to sysfs
Date:   Sun,  5 May 2019 21:34:56 -0400
Message-Id: <20190506013456.86061-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The kheaders archive consisting of the kernel headers used for compiling
bpf programs is in /proc. However there is concern that moving it here
will make it permanent. Let us move it to /sys/kernel as discussed [1].

[1] https://lore.kernel.org/patchwork/patch/1067310/#1265969

Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
This patch applies on top of the previous patch that was applied to the
driver tree:
https://lore.kernel.org/patchwork/patch/1067310/

v2->v3: Fixed sysfs file mode nit (Greg).
v1->v2: Fixed some kconfig nits.

 init/Kconfig                                | 16 ++++-----
 kernel/Makefile                             |  4 +--
 kernel/{gen_ikh_data.sh => gen_kheaders.sh} |  2 +-
 kernel/kheaders.c                           | 40 +++++++++------------
 4 files changed, 26 insertions(+), 36 deletions(-)
 rename kernel/{gen_ikh_data.sh => gen_kheaders.sh} (98%)

diff --git a/init/Kconfig b/init/Kconfig
index 26a364a95b57..c3661991b089 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -579,15 +579,13 @@ config IKCONFIG_PROC
 	  This option enables access to the kernel configuration file
 	  through /proc/config.gz.
 
-config IKHEADERS_PROC
-	tristate "Enable kernel header artifacts through /proc/kheaders.tar.xz"
-	depends on PROC_FS
-	help
-	  This option enables access to the kernel header and other artifacts that
-	  are generated during the build process. These can be used to build eBPF
-	  tracing programs, or similar programs.  If you build the headers as a
-	  module, a module called kheaders.ko is built which can be loaded on-demand
-	  to get access to the headers.
+config IKHEADERS
+	tristate "Enable kernel headers through /sys/kernel/kheaders.tar.xz"
+	help
+	  This option enables access to the in-kernel headers that are generated during
+	  the build process. These can be used to build eBPF tracing programs,
+	  or similar programs.  If you build the headers as a module, a module called
+	  kheaders.ko is built which can be loaded on-demand to get access to headers.
 
 config LOG_BUF_SHIFT
 	int "Kernel log buffer size (16 => 64KB, 17 => 128KB)"
diff --git a/kernel/Makefile b/kernel/Makefile
index 12399614c350..b32a558fae2f 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -70,7 +70,7 @@ obj-$(CONFIG_UTS_NS) += utsname.o
 obj-$(CONFIG_USER_NS) += user_namespace.o
 obj-$(CONFIG_PID_NS) += pid_namespace.o
 obj-$(CONFIG_IKCONFIG) += configs.o
-obj-$(CONFIG_IKHEADERS_PROC) += kheaders.o
+obj-$(CONFIG_IKHEADERS) += kheaders.o
 obj-$(CONFIG_SMP) += stop_machine.o
 obj-$(CONFIG_KPROBES_SANITY_TEST) += test_kprobes.o
 obj-$(CONFIG_AUDIT) += audit.o auditfilter.o
@@ -126,7 +126,7 @@ $(obj)/config_data.gz: $(KCONFIG_CONFIG) FORCE
 $(obj)/kheaders.o: $(obj)/kheaders_data.tar.xz
 
 quiet_cmd_genikh = CHK     $(obj)/kheaders_data.tar.xz
-cmd_genikh = $(srctree)/kernel/gen_ikh_data.sh $@
+cmd_genikh = $(srctree)/kernel/gen_kheaders.sh $@
 $(obj)/kheaders_data.tar.xz: FORCE
 	$(call cmd,genikh)
 
diff --git a/kernel/gen_ikh_data.sh b/kernel/gen_kheaders.sh
similarity index 98%
rename from kernel/gen_ikh_data.sh
rename to kernel/gen_kheaders.sh
index 591a94f7b387..581b83534587 100755
--- a/kernel/gen_ikh_data.sh
+++ b/kernel/gen_kheaders.sh
@@ -2,7 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 # This script generates an archive consisting of kernel headers
-# for CONFIG_IKHEADERS_PROC.
+# for CONFIG_IKHEADERS.
 set -e
 spath="$(dirname "$(readlink -f "$0")")"
 kroot="$spath/.."
diff --git a/kernel/kheaders.c b/kernel/kheaders.c
index 70ae6052920d..8f69772af77b 100644
--- a/kernel/kheaders.c
+++ b/kernel/kheaders.c
@@ -8,9 +8,8 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/proc_fs.h>
+#include <linux/kobject.h>
 #include <linux/init.h>
-#include <linux/uaccess.h>
 
 /*
  * Define kernel_headers_data and kernel_headers_data_end, within which the
@@ -31,39 +30,32 @@ extern char kernel_headers_data;
 extern char kernel_headers_data_end;
 
 static ssize_t
-ikheaders_read_current(struct file *file, char __user *buf,
-		      size_t len, loff_t *offset)
+ikheaders_read(struct file *file,  struct kobject *kobj,
+	       struct bin_attribute *bin_attr,
+	       char *buf, loff_t off, size_t len)
 {
-	return simple_read_from_buffer(buf, len, offset,
-				       &kernel_headers_data,
-				       &kernel_headers_data_end -
-				       &kernel_headers_data);
+	memcpy(buf, &kernel_headers_data + off, len);
+	return len;
 }
 
-static const struct file_operations ikheaders_file_ops = {
-	.read = ikheaders_read_current,
-	.llseek = default_llseek,
+static struct bin_attribute kheaders_attr __ro_after_init = {
+	.attr = {
+		.name = "kheaders.tar.xz",
+		.mode = 0444,
+	},
+	.read = &ikheaders_read,
 };
 
 static int __init ikheaders_init(void)
 {
-	struct proc_dir_entry *entry;
-
-	/* create the current headers file */
-	entry = proc_create("kheaders.tar.xz", S_IRUGO, NULL,
-			    &ikheaders_file_ops);
-	if (!entry)
-		return -ENOMEM;
-
-	proc_set_size(entry,
-		      &kernel_headers_data_end -
-		      &kernel_headers_data);
-	return 0;
+	kheaders_attr.size = (&kernel_headers_data_end -
+			      &kernel_headers_data);
+	return sysfs_create_bin_file(kernel_kobj, &kheaders_attr);
 }
 
 static void __exit ikheaders_cleanup(void)
 {
-	remove_proc_entry("kheaders.tar.xz", NULL);
+	sysfs_remove_bin_file(kernel_kobj, &kheaders_attr);
 }
 
 module_init(ikheaders_init);
-- 
2.21.0.1020.gf2820cf01a-goog
