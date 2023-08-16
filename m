Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1D777E7E8
	for <lists+linux-doc@lfdr.de>; Wed, 16 Aug 2023 19:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345116AbjHPRvT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 16 Aug 2023 13:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345068AbjHPRvA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Aug 2023 13:51:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED73E1FD0
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 10:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692208212;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=OgS5/8uGly2sniToh80UD20m9zUfkHMdpXbITA9PzKk=;
        b=UZnPZqy+b0nQk4XsP7ifr/DhwM1mojj/4IOwBGD3FIiXRy0HerAAZMSG0tuqN0vrn1Peoj
        SdRmaDVVVD2ThWW91aOKQDntW7ivntcAC/n1B7seGJ5SMFIwrc6VPh4a2iHGPsHOuCfFsq
        YeL9WMNgIa2Iaj1rkI1SmkHjtr3bOu0=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-686-Vqwh6lMyOBK_tjCvJ3FZYQ-1; Wed, 16 Aug 2023 13:50:06 -0400
X-MC-Unique: Vqwh6lMyOBK_tjCvJ3FZYQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 893C1381494C;
        Wed, 16 Aug 2023 17:50:05 +0000 (UTC)
Received: from segfault.boston.devel.redhat.com (segfault.boston.devel.redhat.com [10.19.60.26])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id D35894094DC0;
        Wed, 16 Aug 2023 17:50:04 +0000 (UTC)
From:   Jeff Moyer <jmoyer@redhat.com>
To:     matteorizzo@google.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, io-uring@vger.kernel.org,
        axboe@kernel.dk, asml.silence@gmail.com
Cc:     corbet@lwn.net, akpm@linux-foundation.org, keescook@chromium.org,
        ribalda@chromium.org, rostedt@goodmis.org, jannh@google.com,
        chenhuacai@kernel.org, gpiccoli@igalia.com, ldufour@linux.ibm.com,
        evn@google.com, poprdi@google.com, jordyzomer@google.com,
        krisman@suse.de, andres@anarazel.de
Subject: [PATCH v4] io_uring: add a sysctl to disable io_uring system-wide
X-PGP-KeyID: 1F78E1B4
X-PGP-CertKey: F6FE 280D 8293 F72C 65FD  5A58 1FF8 A7CA 1F78 E1B4
Date:   Wed, 16 Aug 2023 13:55:51 -0400
Message-ID: <x49wmxuub14.fsf@segfault.boston.devel.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Matteo Rizzo <matteorizzo@google.com>

Introduce a new sysctl (io_uring_disabled) which can be either 0, 1, or
2. When 0 (the default), all processes are allowed to create io_uring
instances, which is the current behavior.  When 1, io_uring creation is
disabled (io_uring_setup() will fail with -EPERM) for processes not in
the kernel.io_uring_group group.  When 2, calls to io_uring_setup() fail
with -EPERM regardless of privilege.

Signed-off-by: Matteo Rizzo <matteorizzo@google.com>
[JEM: modified to add io_uring_group]
Signed-off-by: Jeff Moyer <jmoyer@redhat.com>

---
v4:

* Add a kernel.io_uring_group sysctl to hold a group id that is allowed
  to use io_uring.  One thing worth pointing out is that, when a group
  is specified, only users in that group can create an io_uring.  That
  means that if the root user is not in that group, root can not make
  use of io_uring.

  I also wrote unit tests for liburing.  I'll post that as well if there
  is consensus on this approach.

  Matteo, you didn't reply to Jens' message about pulling the patch, so
  I figured you got busy, so I picked up the patch.  I hope you're okay
  with the signoff.

v3:

* Fix the commit message
* Use READ_ONCE in io_uring_allowed to avoid races
* Add reviews

v2:

* Documentation style fixes
* Add a third level that only disables io_uring for unprivileged
  processes

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 3800fab1619b..dc4b19f2f2cb 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -450,6 +450,34 @@ this allows system administrators to override the
 ``IA64_THREAD_UAC_NOPRINT`` ``prctl`` and avoid logs being flooded.
 
 
+io_uring_disabled
+=================
+
+Prevents all processes from creating new io_uring instances. Enabling this
+shrinks the kernel's attack surface.
+
+= ======================================================================
+0 All processes can create io_uring instances as normal. This is the
+  default setting.
+1 io_uring creation is disabled (io_uring_setup() will fail with -EPERM)
+  for processes not in the io_uring_group group.  Existing io_uring
+  instances can still be used.  See the documentation for io_uring_group
+  for more information.
+2 io_uring creation is disabled for all processes. io_uring_setup()
+  always fails with -EPERM. Existing io_uring instances can still be
+  used.
+= ======================================================================
+
+
+io_uring_group
+==============
+
+When io_uring_disabled is set to 1, a process must be in the
+io_uring_group group in order to create an io_uring instance.  If
+io_uring_group is set to -1 (the default), only processes with the
+CAP_SYS_ADMIN capability may create io_uring instances.
+
+
 kexec_load_disabled
 ===================
 
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 93db3e4e7b68..fbee37fb9bad 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -152,6 +152,31 @@ static void __io_submit_flush_completions(struct io_ring_ctx *ctx);
 
 struct kmem_cache *req_cachep;
 
+static int __read_mostly sysctl_io_uring_disabled;
+static int __read_mostly sysctl_io_uring_group = -1;
+
+#ifdef CONFIG_SYSCTL
+static struct ctl_table kernel_io_uring_disabled_table[] = {
+	{
+		.procname	= "io_uring_disabled",
+		.data		= &sysctl_io_uring_disabled,
+		.maxlen		= sizeof(sysctl_io_uring_disabled),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_TWO,
+	},
+	{
+		.procname	= "io_uring_group",
+		.data		= &sysctl_io_uring_group,
+		.maxlen		= sizeof(gid_t),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec,
+	},
+	{},
+};
+#endif
+
 struct sock *io_uring_get_socket(struct file *file)
 {
 #if defined(CONFIG_UNIX)
@@ -4040,9 +4065,31 @@ static long io_uring_setup(u32 entries, struct io_uring_params __user *params)
 	return io_uring_create(entries, &p, params);
 }
 
+static inline bool io_uring_allowed(void)
+{
+	int disabled = READ_ONCE(sysctl_io_uring_disabled);
+	kgid_t io_uring_group;
+
+	if (disabled == 0)
+		return true;
+
+	if (disabled == 2)
+		return false;
+
+	/* default to root only */
+	io_uring_group = make_kgid(&init_user_ns, sysctl_io_uring_group);
+	if (!gid_valid(io_uring_group))
+		return capable(CAP_SYS_ADMIN);
+
+	return in_group_p(io_uring_group);
+}
+
 SYSCALL_DEFINE2(io_uring_setup, u32, entries,
 		struct io_uring_params __user *, params)
 {
+	if (!io_uring_allowed())
+		return -EPERM;
+
 	return io_uring_setup(entries, params);
 }
 
@@ -4617,6 +4664,11 @@ static int __init io_uring_init(void)
 
 	req_cachep = KMEM_CACHE(io_kiocb, SLAB_HWCACHE_ALIGN | SLAB_PANIC |
 				SLAB_ACCOUNT | SLAB_TYPESAFE_BY_RCU);
+
+#ifdef CONFIG_SYSCTL
+	register_sysctl_init("kernel", kernel_io_uring_disabled_table);
+#endif
+
 	return 0;
 };
 __initcall(io_uring_init);

