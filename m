Return-Path: <linux-doc+bounces-39556-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B52A46ACF
	for <lists+linux-doc@lfdr.de>; Wed, 26 Feb 2025 20:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E7373AF170
	for <lists+linux-doc@lfdr.de>; Wed, 26 Feb 2025 19:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7888623957D;
	Wed, 26 Feb 2025 19:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T9CLWFGF"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA670236A72
	for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 19:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740597662; cv=none; b=Twa64oubNFqtljKK5edyIrRiMsB3gW2Hjnypre6HlXiOzdS+Z3hO3bTVUMA8jEwo/Zo2qA3Z3qvi8Qk8AIxJ11Lkbu/1bMrh/mR02kkYYXMlqaGiM7SdIqR0/eCKRtOo42UhydnW3okED2cxgmbkJDOdRwS5MA4nRdxrpvtmNHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740597662; c=relaxed/simple;
	bh=f3D5SzrEgNHbb8uoACbdyA7D/ocFrbJamaLh8HLKBTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ih9Wb2OjFwVfSOHhE3wX+pDfAb4I4z+2O/aSd5D3vcs3hrG7Am+NWJpmh/AaQZxxPKRSNwxeCAP6aVcov7OH+1/rqpw+igIacmR18ybTcczkslNYsmCVUP5kmj2ul9g4kXLvRGJoY0+ajJ4/Wvd166kdkl57dTODpdGLY1d5gs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T9CLWFGF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2210d92292eso2644485ad.1
        for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 11:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740597660; x=1741202460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftDlP5dl9GiHDKQQcwmxqQBAFQOLT3kYr7RqF+evPv4=;
        b=T9CLWFGFyxObY7Qdi9ncQ7o6G+xyuOxMupLBqbOD9c3DAw/QZfPyBVK27YA50802io
         qORMbZQpF/wfrBqnpiPnoX2Gl+fA4zbS7JrILqyiKmOupXC+iK6/rXHbtEPowXIvsAYz
         OaCr5vzX/awnAEXfEjknAMKq03TMaICLZl0qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740597660; x=1741202460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftDlP5dl9GiHDKQQcwmxqQBAFQOLT3kYr7RqF+evPv4=;
        b=O4SDlvGfuAYx7BD/3UYbeHZYDsZKG2/0ZagHmRoR5fj8A48gbu1kJ7kv+r1IqiNYqO
         U9oN9Cz/kz++iPvFFsheNGQ6HmCyG+FD1EWyKBl30zmdgrVxbnG6l9W2eN/gDHFRmO39
         KXgSxexVc0CnZwKBy9B95zJGxUzVIXU+i3OqSQKVxlABgcPJJEjvK8LR4NeSk/F+VSXY
         u+opAdHhFVL1ufiZj206cAvQPN7OGTTXNO4MwkJwZ/xP7X/ku86KGEYwPoTzKp4XsgPO
         G1Atptj/KLC1uVSzLBIacQ6u8swVnvVGfBJfVqWDk5hbHFOaoJdK5Ul3JnEFq/LH0+qg
         10DQ==
X-Forwarded-Encrypted: i=1; AJvYcCU34d92udK7plPyOcQ6V5OyJ5ZQqPv0YoJ/em6nuG8F3gGp9KbyKIOYzXwG6FlbAVOP3piBW3gkaos=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAYm5WW/SiRPKN2sFL7a8rhF3F9SaxgJ/ZVeFC917waJLyAY2J
	ECikOWsBn0uXWOiU8Np7sth8CFlPyGe+t3APKuxRKa4+cINmqAf8qXoFfj+v/Q==
X-Gm-Gg: ASbGncv0ClQ4r0NX/ufWajY4Mn/AUCowQVwyk7hbHCFfWlr5dNd8whRbr0zuTHc34IR
	SMwdfEseoKef/xf+4Y6Ei895//b+ZIFKg5Arcbx9HcLfjlQdUL+hSwH3jV8bKdkm7h2tQJue1ZH
	GLNxzQUgcRukzxNHtrjsm7iVNAIqIQQd6OjYYxCTCmIGD+3G3/Dzhzbu/a3K9eJuZnkxigvALN1
	fNcT1QdQDIF3YO4Xz8CtLQnMUIOKbHTKwsUAkMgNGYUQ63ypgTQju1bW8I2CM9oLBqUiAdqDvM5
	JxSC/+euLFTTXzNZM7+UzcypF8z5okR9qvmjeiJ0CoLUrwtcgVDyVumX8ap92jmcNmlT33sgcWP
	A3YuMCx53w2bR
X-Google-Smtp-Source: AGHT+IEw7fjT6gjAu149mqZBw/+HbKxFMCO0gdM2niphUvj6eNocm8iaPbU/SjDPbzzxoTCe6NQ10A==
X-Received: by 2002:a17:902:d50a:b0:220:d1c3:24d1 with SMTP id d9443c01a7336-223202136b8mr65669475ad.46.1740597659906;
        Wed, 26 Feb 2025 11:20:59 -0800 (PST)
Received: from li-cloudtop.c.googlers.com.com (4.198.125.34.bc.googleusercontent.com. [34.125.198.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22341c04d16sm8473865ad.190.2025.02.26.11.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 11:20:59 -0800 (PST)
From: Li Li <dualli@chromium.org>
To: dualli@google.com,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	donald.hunter@gmail.com,
	gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	maco@android.com,
	joel@joelfernandes.org,
	brauner@kernel.org,
	cmllamas@google.com,
	surenb@google.com,
	omosnace@redhat.com,
	shuah@kernel.org,
	arnd@arndb.de,
	masahiroy@kernel.org,
	bagasdotme@gmail.com,
	horms@kernel.org,
	tweek@google.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	selinux@vger.kernel.org,
	hridya@google.com
Cc: smoreland@google.com,
	ynaffit@google.com,
	kernel-team@android.com
Subject: [PATCH v15 1/3] lsm, selinux: Add setup_report permission to binder
Date: Wed, 26 Feb 2025 11:20:45 -0800
Message-ID: <20250226192047.734627-2-dualli@chromium.org>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
In-Reply-To: <20250226192047.734627-1-dualli@chromium.org>
References: <20250226192047.734627-1-dualli@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thiébaud Weksteen <tweek@google.com>

Introduce a new permission "setup_report" to the "binder" class.
This persmission controls the ability to set up the binder generic
netlink driver to report certain binder transactions.

Signed-off-by: Thiébaud Weksteen <tweek@google.com>
Signed-off-by: Li Li <dualli@google.com>
---
 include/linux/lsm_hook_defs.h       |  1 +
 include/linux/security.h            |  1 +
 security/security.c                 | 13 +++++++++++++
 security/selinux/hooks.c            |  7 +++++++
 security/selinux/include/classmap.h |  3 ++-
 5 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 9eb313bd0c93..5291cd712147 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -33,6 +33,7 @@ LSM_HOOK(int, 0, binder_transfer_binder, const struct cred *from,
 	 const struct cred *to)
 LSM_HOOK(int, 0, binder_transfer_file, const struct cred *from,
 	 const struct cred *to, const struct file *file)
+LSM_HOOK(int, 0, binder_setup_report, const struct cred *to)
 LSM_HOOK(int, 0, ptrace_access_check, struct task_struct *child,
 	 unsigned int mode)
 LSM_HOOK(int, 0, ptrace_traceme, struct task_struct *parent)
diff --git a/include/linux/security.h b/include/linux/security.h
index 27f64a9747f8..28fcd7047051 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -338,6 +338,7 @@ int security_binder_transfer_binder(const struct cred *from,
 				    const struct cred *to);
 int security_binder_transfer_file(const struct cred *from,
 				  const struct cred *to, const struct file *file);
+int security_binder_setup_report(const struct cred *to);
 int security_ptrace_access_check(struct task_struct *child, unsigned int mode);
 int security_ptrace_traceme(struct task_struct *parent);
 int security_capget(const struct task_struct *target,
diff --git a/security/security.c b/security/security.c
index c9fae447327e..6212158cec72 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1043,6 +1043,19 @@ int security_binder_transfer_file(const struct cred *from,
 	return call_int_hook(binder_transfer_file, from, to, file);
 }
 
+/**
+ * security_binder_setup_report() - Check if process allowed to set up binder reports.
+ * @to: receiving process
+ *
+ * Check whether @to is allowed to set up binder reports.
+ *
+ * Return: Returns 0 if permission is granted.
+ */
+int security_binder_setup_report(const struct cred *to)
+{
+	return call_int_hook(binder_setup_report, to);
+}
+
 /**
  * security_ptrace_access_check() - Check if tracing is allowed
  * @child: target process
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index b49f28f15ed1..12da5861ec18 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -2092,6 +2092,12 @@ static int selinux_binder_transfer_file(const struct cred *from,
 			    &ad);
 }
 
+static int selinux_binder_setup_report(const struct cred *to)
+{
+	return avc_has_perm(current_sid(), cred_sid(to), SECCLASS_BINDER,
+			    BINDER__SETUP_REPORT, NULL);
+}
+
 static int selinux_ptrace_access_check(struct task_struct *child,
 				       unsigned int mode)
 {
@@ -7176,6 +7182,7 @@ static struct security_hook_list selinux_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(binder_transaction, selinux_binder_transaction),
 	LSM_HOOK_INIT(binder_transfer_binder, selinux_binder_transfer_binder),
 	LSM_HOOK_INIT(binder_transfer_file, selinux_binder_transfer_file),
+	LSM_HOOK_INIT(binder_setup_report, selinux_binder_setup_report),
 
 	LSM_HOOK_INIT(ptrace_access_check, selinux_ptrace_access_check),
 	LSM_HOOK_INIT(ptrace_traceme, selinux_ptrace_traceme),
diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
index 8a8f3908aac8..11e6fa92799b 100644
--- a/security/selinux/include/classmap.h
+++ b/security/selinux/include/classmap.h
@@ -133,7 +133,8 @@ const struct security_class_mapping secclass_map[] = {
 	{ "kernel_service", { "use_as_override", "create_files_as", NULL } },
 	{ "tun_socket", { COMMON_SOCK_PERMS, "attach_queue", NULL } },
 	{ "binder",
-	  { "impersonate", "call", "set_context_mgr", "transfer", NULL } },
+	  { "impersonate", "call", "set_context_mgr", "transfer",
+	    "setup_report", NULL } },
 	{ "cap_userns", { COMMON_CAP_PERMS, NULL } },
 	{ "cap2_userns", { COMMON_CAP2_PERMS, NULL } },
 	{ "sctp_socket",
-- 
2.48.1.658.g4767266eb4-goog


