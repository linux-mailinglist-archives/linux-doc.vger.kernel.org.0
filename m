Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03453E0D72
	for <lists+linux-doc@lfdr.de>; Tue, 22 Oct 2019 22:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732353AbfJVUqN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 22 Oct 2019 16:46:13 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34758 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731452AbfJVUqM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Oct 2019 16:46:12 -0400
Received: by mail-pg1-f195.google.com with SMTP id k20so10681651pgi.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Oct 2019 13:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eAmRvm5cPxUX+RLLkD46rr46EFdWHG96dg9AvuA9RTk=;
        b=CGf/mqiFuSsvZSH/JRL+Sh4WEIKfn3EIqHDPS0vy+j6KfS7AJg6ipW111Uon/+dQ3J
         zRxDMpZeDrP4hKR5borH8EdWF1RPfNp48MIgmjhcFnfZaLuBQv4Q0f1XY09KDGSUyuEg
         jO6Ra0/Z4Waui1QzcdTuONT/v7SyT3zcWUdCboQiOwLH37IcbduiOCAQxbt47+FFiToj
         O/SDhaiDvoUfeuej7AXgbnGcA23x2WWztkS74GeBV0QRiHc5+hcMQ4hVns8ZTqNGUTv+
         RxYaLea3CgsjWdKZJN/kZtX7TnlwmLIj4cHKGuR29t+N2fYc/a6xlryF2v/9E22fnl8I
         MRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eAmRvm5cPxUX+RLLkD46rr46EFdWHG96dg9AvuA9RTk=;
        b=Oc7QaCtGEaGaH/LVez5FthITAZo5XP0UvNIsnY2FjRew58Hqfsb8oG8O5lI/9/60Ih
         BJJFCjQfqVsPn54+tf5ehoOfx/ZKhZOfoJhxZ+30BUqCX8nzxRG93sqhEeM8ugR80cAe
         ziohp/pMXYbEMMk1pu066U+4XcWGLBY6KK+PaiSdqAzxI6Xr5o/aeyNpcwcUfJkRSKdW
         UGCG0Xq91I5/kUtFaqAMezORDz87f/214ZMfMH+yKrYlgBwpA+LiIjrZdEXiKh1k8aNc
         cd53cMUnFg5FfGbzkDAGuur6lafSzm1IjAMZOuVneB/4XOWK5mW21/vf+Yi7kAVUiviX
         X0Jg==
X-Gm-Message-State: APjAAAU7UI2WQj4x/qMtFvb8yra+mJyLG0snhMem8qocb3T7ohOtG/dI
        WZCI3zFBJAWXARYO4rm++mto5Q==
X-Google-Smtp-Source: APXvYqxywdX/pl2L/3nQW3TwLGfgYa7BAnuOvvAlVc1aeXxf1QQODFSaKaSldIQUrgmSIUP2U+gdww==
X-Received: by 2002:a63:cf45:: with SMTP id b5mr5844247pgj.36.1571777172075;
        Tue, 22 Oct 2019 13:46:12 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com ([2620:15c:211:200:5404:91ba:59dc:9400])
        by smtp.gmail.com with ESMTPSA id l184sm19810903pfl.76.2019.10.22.13.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 13:46:11 -0700 (PDT)
From:   Mark Salyzyn <salyzyn@android.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, Mark Salyzyn <salyzyn@android.com>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Jonathan Corbet <corbet@lwn.net>,
        Vivek Goyal <vgoyal@redhat.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        linux-unionfs@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: [PATCH v14 3/5] overlayfs: handle XATTR_NOSECURITY flag for get xattr method
Date:   Tue, 22 Oct 2019 13:44:48 -0700
Message-Id: <20191022204453.97058-4-salyzyn@android.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191022204453.97058-1-salyzyn@android.com>
References: <20191022204453.97058-1-salyzyn@android.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Because of the overlayfs getxattr recursion, the incoming inode fails
to update the selinux sid resulting in avc denials being reported
against a target context of u:object_r:unlabeled:s0.

Solution is to respond to the XATTR_NOSECURITY flag in get xattr
method that calls the __vfs_getxattr handler instead so that the
context can be read in, rather than being denied with an -EACCES
when vfs_getxattr handler is called.

For the use case where access is to be blocked by the security layer.

The path then would be security(dentry) ->
__vfs_getxattr({dentry...XATTR_NOSECURITY}) ->
handler->get({dentry...XATTR_NOSECURITY}) ->
__vfs_getxattr({realdentry...XATTR_NOSECURITY}) ->
lower_handler->get({realdentry...XATTR_NOSECURITY}) which
would report back through the chain data and success as expected,
the logging security layer at the top would have the data to
determine the access permissions and report back to the logs and
the caller that the target context was blocked.

For selinux this would solve the cosmetic issue of the selinux log
and allow audit2allow to correctly report the rule needed to address
the access problem.

Signed-off-by: Mark Salyzyn <salyzyn@android.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: Eric W. Biederman <ebiederm@xmission.com>
Cc: Amir Goldstein <amir73il@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Smalley <sds@tycho.nsa.gov>
Cc: linux-unionfs@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: kernel-team@android.com
Cc: linux-security-module@vger.kernel.org

---
v14 - rebase to use xattr_gs_args.

v13 - rebase to use __vfs_getxattr flags option.

v12 - Added back to patch series as get xattr with flag option.

v11 - Squashed out of patch series and replaced with per-thread flag
      solution.

v10 - Added to patch series as __get xattr method.

---
 fs/overlayfs/inode.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/overlayfs/inode.c b/fs/overlayfs/inode.c
index 5fb7608647a4..2eb037c325bf 100644
--- a/fs/overlayfs/inode.c
+++ b/fs/overlayfs/inode.c
@@ -367,12 +367,15 @@ int ovl_xattr_get(struct xattr_gs_args *args)
 {
 	ssize_t res;
 	const struct cred *old_cred;
-	struct dentry *realdentry =
+	struct xattr_gs_args my_args = *args;
+
+	my_args.dentry =
 		ovl_i_dentry_upper(args->inode) ?:
 		ovl_dentry_lower(args->dentry);
+	my_args.inode = d_inode(my_args.dentry);
 
 	old_cred = ovl_override_creds(args->dentry->d_sb);
-	res = vfs_getxattr(realdentry, args->name, args->buffer, args->size);
+	res = __vfs_getxattr(&my_args);
 	revert_creds(old_cred);
 	return res;
 }
-- 
2.23.0.866.gb869b98d4c-goog

