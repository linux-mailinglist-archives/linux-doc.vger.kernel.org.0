Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73EF163C76
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jul 2019 22:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729619AbfGIUIV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 9 Jul 2019 16:08:21 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36061 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729563AbfGIUIU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Jul 2019 16:08:20 -0400
Received: by mail-lf1-f66.google.com with SMTP id q26so14270677lfc.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Jul 2019 13:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eng.ucsd.edu; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nPhFlUg160YIM5+wm6v8cRWOklVUq1HxImS3+DfzTd0=;
        b=PUJkz0FBCQCSz7JsKk1v6RISYYb4uLBoN78kFvm+Iw2/PL2u3QbrMWBzJ5WcH35ASg
         PtcuiBqmuUQWk1966XcAi4amWzqXC9cE4jqn58nlqZtkcOKraYiVlCt4RZM3A2nCe3Of
         cypMt4nQ84B7R7rFT2pbAToU1gO9HIOXBtetk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nPhFlUg160YIM5+wm6v8cRWOklVUq1HxImS3+DfzTd0=;
        b=lBgM6bKa4Iyea9KpClA7KOmjq1EFhZoB+n9suWWjOH5HfIo6AP0t3vZiBq5CWSegxV
         8C5dOIK2/IIde18A8NEzWi0deovD6HMD4HysEHxlQRbyg7KmWfiE4JsLF3cetQ1M+jii
         klSGgwlkH0tpQVXT+WreKwhBZdOoRhgnU7gduvG4DO8ZpBNWdS6IB6RW+Oe9ZLlm4E/v
         vqZKXJYaEmfAQprzAvDRvVpxkAU3EVNCSfvYGdMMuH5lEzTrdDX2/rVTgY7DyCX/7/Ux
         +BN5RHjuV5pIWmI1M+idf8cvgtjVVLqa3mJT1SnWHtXqgkiBVktWLVjcTjdRqjdj/Es9
         9x7Q==
X-Gm-Message-State: APjAAAW4gAScZmb+678tWWM+fZ4FBSKoO22uGq+w2QTsW4QcKOGkUUX9
        kPHyyhzEyhGAyLNlxL+HOUi56Q==
X-Google-Smtp-Source: APXvYqzNSk+qmgC/RcZPrqM4OfhOxlepPwzhf81+ba0k0BKPTZvqF+t+RraLwhsiS85v4y43wTqFMg==
X-Received: by 2002:ac2:5336:: with SMTP id f22mr12185607lfh.180.1562702898776;
        Tue, 09 Jul 2019 13:08:18 -0700 (PDT)
Received: from luke-XPS-13.home (159-205-76-204.adsl.inetia.pl. [159.205.76.204])
        by smtp.gmail.com with ESMTPSA id f1sm4489ljk.86.2019.07.09.13.08.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 13:08:18 -0700 (PDT)
From:   Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
X-Google-Original-From: Luke Nowakowski-Krijger <lnowakow@neg.ucsd.edu>
To:     linux-kernel-mentees@lists.linuxfoundation.org
Cc:     Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>,
        pbonzini@redhat.com, rkrcmar@redhat.com, corbet@lwn.net,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] Documentation: virtual: Add toctree hooks
Date:   Tue,  9 Jul 2019 13:07:21 -0700
Message-Id: <20190709200721.16991-4-lnowakow@neg.ucsd.edu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190709200721.16991-1-lnowakow@neg.ucsd.edu>
References: <20190709200721.16991-1-lnowakow@neg.ucsd.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>

Added toctree hooks for indexing. Hooks added only for newly added
files.

The hook for the top of the tree will be added in a later patch series
when a few more substantial changes have been added.

Signed-off-by: Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
---
 Changes since v2:
 - Removed vcpu-request from hooks that was added in v1
 Changes since v1:
 + Added index.rst file in virtual directory
 + Added index.rst file in virtual/kvm directory
 
 Documentation/virtual/index.rst     | 18 ++++++++++++++++++
 Documentation/virtual/kvm/index.rst | 11 +++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 Documentation/virtual/index.rst
 create mode 100644 Documentation/virtual/kvm/index.rst

diff --git a/Documentation/virtual/index.rst b/Documentation/virtual/index.rst
new file mode 100644
index 000000000000..19c9fa2266f4
--- /dev/null
+++ b/Documentation/virtual/index.rst
@@ -0,0 +1,18 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================
+Linux Virtual Documentation
+===========================
+
+.. toctree::
+   :maxdepth: 2
+
+   kvm/index
+   paravirt_ops
+
+.. only:: html and subproject
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/virtual/kvm/index.rst b/Documentation/virtual/kvm/index.rst
new file mode 100644
index 000000000000..0b206a06f5be
--- /dev/null
+++ b/Documentation/virtual/kvm/index.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===
+KVM
+===
+
+.. toctree::
+   :maxdepth: 2
+
+   amd-memory-encryption
+   cpuid
-- 
2.20.1

