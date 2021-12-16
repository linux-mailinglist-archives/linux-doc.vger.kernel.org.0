Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EFA3476E10
	for <lists+linux-doc@lfdr.de>; Thu, 16 Dec 2021 10:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233200AbhLPJsE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 16 Dec 2021 04:48:04 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51154
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233240AbhLPJsA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Dec 2021 04:48:00 -0500
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DD2A03FFD7
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 09:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639648078;
        bh=UA5EztZHI/uiiMUXLzWoUuv2dZPMgtdfvbN4/RIGhNw=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=f/HhbrlvQocddEJJJuRsGZRUCb6Pf0FPMJdeL9WeTXio87QJCQhfjzzlsY1UjB8gt
         VpQLCf9kIEL5ywvOGkDdZyotAoiVj/tto41gCCgMODvlukjOUpPD/7ufv/vxvbQXe1
         AsKzU5smXY9+LGFq7iKrOH6ukEN/Q7dP8/66lA7mcFJnt7CJovkql9+HbVS28h8vg+
         SedtfN4eajFxrFqFK+tMTY38wcciamaIx5EtRubqMnCOrUpT+k5++jFBN7jaDiymzX
         KLbgiIqX6DmkHs4kdH6wnzlc2orS3+jfUj1SagmIuOsm2NzW4fZSpjWHOsdt0ULpFm
         eIM8N3QXdYT1Q==
Received: by mail-wm1-f72.google.com with SMTP id 144-20020a1c0496000000b003305ac0e03aso1017122wme.8
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 01:47:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UA5EztZHI/uiiMUXLzWoUuv2dZPMgtdfvbN4/RIGhNw=;
        b=7aLqI+KMZhlJP+yiAfctXZa516xzc3BStZItECFQt+is4Jvt92AqriAm+etRUztYoO
         5QG1VcAXNg3dfWCkGyIwBJc9NaCGX0RAVBebEBPc1ZK00C6ULj8UQFcgydo1bH0z5YeY
         lqb4uezGal9+uqkfLMMGjFMcNtdSBmy8TNCDtDsO7hr38U/3eM1R1n66X3xukn0/WzOG
         1vpjP4PJ7LSUrQMXw5PVGyNAKsTnkc4/v42SfwFSueBEJF54MkGp032Fmwiojolcofk/
         gDQxDEYp6pdKbFDTKNQJpG7/BAeYOa3ifm0nFWeSpDkxTcrYn4xsVuJNZA9ZgiN+r3GT
         lbvg==
X-Gm-Message-State: AOAM533I5Asz4az0KIXVKrTUFlzOy0fMAPBfCGc5DRj0GOpK2nXVadcy
        CrsIjiOIRHvkNIjRlDDGRcJ/zk+RsRMXQXxS1O3GtFU8DWEQdRzNzcn38gkZGjH3v2egM+xDeE3
        eTUdznZQH4AlLgW8Os1KTgtJED9kdJeWm63GtAQ==
X-Received: by 2002:a1c:740c:: with SMTP id p12mr316010wmc.140.1639648077994;
        Thu, 16 Dec 2021 01:47:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyePI8Du4Q8VFJBsAu6osq6C3A++AYoB7smlNaZZ2VPRzrhLbuU04wBMA93ArT9KvS81ExrOQ==
X-Received: by 2002:a1c:740c:: with SMTP id p12mr315973wmc.140.1639648077773;
        Thu, 16 Dec 2021 01:47:57 -0800 (PST)
Received: from alex.home (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr. [90.112.158.1])
        by smtp.gmail.com with ESMTPSA id g124sm7250562wme.28.2021.12.16.01.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 01:47:57 -0800 (PST)
From:   Alexandre Ghiti <alexandre.ghiti@canonical.com>
To:     Steve French <sfrench@samba.org>, Jonathan Corbet <corbet@lwn.net>,
        David Howells <dhowells@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jeff Layton <jlayton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Ronnie Sahlberg <lsahlber@redhat.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>, linux-cifs@vger.kernel.org,
        samba-technical@lists.samba.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        linux-power@fi.rohmeurope.com
Cc:     Alexandre Ghiti <alexandre.ghiti@canonical.com>,
        Steve French <smfrench@gmail.com>
Subject: [PATCH v2 3/6] Documentation, arch: Remove leftovers from CIFS_WEAK_PW_HASH
Date:   Thu, 16 Dec 2021 10:44:23 +0100
Message-Id: <20211216094426.2083802-4-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
References: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This config was removed so remove all references to it.

Fixes: 76a3c92ec9e0 ("cifs: remove support for NTLM and weaker authentication algorithms")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Reviewed-by: Steve French <smfrench@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de> [arch/arm/configs]
---
 Documentation/admin-guide/cifs/usage.rst    | 7 +++----
 arch/arm/configs/cm_x300_defconfig          | 1 -
 arch/arm/configs/ezx_defconfig              | 1 -
 arch/arm/configs/imote2_defconfig           | 1 -
 arch/arm/configs/nhk8815_defconfig          | 1 -
 arch/arm/configs/pxa_defconfig              | 1 -
 arch/mips/configs/fuloong2e_defconfig       | 1 -
 arch/mips/configs/malta_qemu_32r6_defconfig | 1 -
 arch/mips/configs/maltaaprp_defconfig       | 1 -
 arch/mips/configs/maltasmvp_defconfig       | 1 -
 arch/mips/configs/maltasmvp_eva_defconfig   | 1 -
 arch/mips/configs/maltaup_defconfig         | 1 -
 arch/powerpc/configs/ppc6xx_defconfig       | 1 -
 arch/sh/configs/titan_defconfig             | 1 -
 14 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/Documentation/admin-guide/cifs/usage.rst b/Documentation/admin-guide/cifs/usage.rst
index f170d8820258..3766bf8a1c20 100644
--- a/Documentation/admin-guide/cifs/usage.rst
+++ b/Documentation/admin-guide/cifs/usage.rst
@@ -734,10 +734,9 @@ SecurityFlags		Flags which control security negotiation and
 			using weaker password hashes is 0x37037 (lanman,
 			plaintext, ntlm, ntlmv2, signing allowed).  Some
 			SecurityFlags require the corresponding menuconfig
-			options to be enabled (lanman and plaintext require
-			CONFIG_CIFS_WEAK_PW_HASH for example).  Enabling
-			plaintext authentication currently requires also
-			enabling lanman authentication in the security flags
+			options to be enabled.  Enabling plaintext
+			authentication currently requires also enabling
+			lanman authentication in the security flags
 			because the cifs module only supports sending
 			laintext passwords using the older lanman dialect
 			form of the session setup SMB.  (e.g. for authentication
diff --git a/arch/arm/configs/cm_x300_defconfig b/arch/arm/configs/cm_x300_defconfig
index 502a9d870ca4..45769d0ddd4e 100644
--- a/arch/arm/configs/cm_x300_defconfig
+++ b/arch/arm/configs/cm_x300_defconfig
@@ -146,7 +146,6 @@ CONFIG_NFS_V3_ACL=y
 CONFIG_NFS_V4=y
 CONFIG_ROOT_NFS=y
 CONFIG_CIFS=m
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_NLS_CODEPAGE_437=m
 CONFIG_NLS_ISO8859_1=m
diff --git a/arch/arm/configs/ezx_defconfig b/arch/arm/configs/ezx_defconfig
index a49e699e52de..ec84d80096b1 100644
--- a/arch/arm/configs/ezx_defconfig
+++ b/arch/arm/configs/ezx_defconfig
@@ -314,7 +314,6 @@ CONFIG_NFSD_V3_ACL=y
 CONFIG_SMB_FS=m
 CONFIG_CIFS=m
 CONFIG_CIFS_STATS=y
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
diff --git a/arch/arm/configs/imote2_defconfig b/arch/arm/configs/imote2_defconfig
index 118c4c927f26..6db871d4e077 100644
--- a/arch/arm/configs/imote2_defconfig
+++ b/arch/arm/configs/imote2_defconfig
@@ -288,7 +288,6 @@ CONFIG_NFSD_V3_ACL=y
 CONFIG_SMB_FS=m
 CONFIG_CIFS=m
 CONFIG_CIFS_STATS=y
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
diff --git a/arch/arm/configs/nhk8815_defconfig b/arch/arm/configs/nhk8815_defconfig
index 23595fc5a29a..907d6512821a 100644
--- a/arch/arm/configs/nhk8815_defconfig
+++ b/arch/arm/configs/nhk8815_defconfig
@@ -127,7 +127,6 @@ CONFIG_NFS_FS=y
 CONFIG_NFS_V3_ACL=y
 CONFIG_ROOT_NFS=y
 CONFIG_CIFS=m
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 58f4834289e6..dedaaae3d0d8 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -699,7 +699,6 @@ CONFIG_NFSD_V3_ACL=y
 CONFIG_NFSD_V4=y
 CONFIG_CIFS=m
 CONFIG_CIFS_STATS=y
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_NLS_DEFAULT="utf8"
diff --git a/arch/mips/configs/fuloong2e_defconfig b/arch/mips/configs/fuloong2e_defconfig
index 5c24ac7fdf56..ba47c5e929b7 100644
--- a/arch/mips/configs/fuloong2e_defconfig
+++ b/arch/mips/configs/fuloong2e_defconfig
@@ -206,7 +206,6 @@ CONFIG_NFSD_V3_ACL=y
 CONFIG_NFSD_V4=y
 CONFIG_CIFS=m
 CONFIG_CIFS_STATS2=y
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_CIFS_DEBUG2=y
diff --git a/arch/mips/configs/malta_qemu_32r6_defconfig b/arch/mips/configs/malta_qemu_32r6_defconfig
index 614af02d83e6..6fb9bc29f4a0 100644
--- a/arch/mips/configs/malta_qemu_32r6_defconfig
+++ b/arch/mips/configs/malta_qemu_32r6_defconfig
@@ -165,7 +165,6 @@ CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_CIFS=m
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
diff --git a/arch/mips/configs/maltaaprp_defconfig b/arch/mips/configs/maltaaprp_defconfig
index 9c051f8fd330..eb72df528243 100644
--- a/arch/mips/configs/maltaaprp_defconfig
+++ b/arch/mips/configs/maltaaprp_defconfig
@@ -166,7 +166,6 @@ CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_CIFS=m
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
diff --git a/arch/mips/configs/maltasmvp_defconfig b/arch/mips/configs/maltasmvp_defconfig
index 2e90d97551d6..1fb40d310f49 100644
--- a/arch/mips/configs/maltasmvp_defconfig
+++ b/arch/mips/configs/maltasmvp_defconfig
@@ -167,7 +167,6 @@ CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_CIFS=m
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
diff --git a/arch/mips/configs/maltasmvp_eva_defconfig b/arch/mips/configs/maltasmvp_eva_defconfig
index d1f7fdb27284..75cb778c6149 100644
--- a/arch/mips/configs/maltasmvp_eva_defconfig
+++ b/arch/mips/configs/maltasmvp_eva_defconfig
@@ -169,7 +169,6 @@ CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_CIFS=m
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
diff --git a/arch/mips/configs/maltaup_defconfig b/arch/mips/configs/maltaup_defconfig
index 48e5bd492452..7b4f247dc60c 100644
--- a/arch/mips/configs/maltaup_defconfig
+++ b/arch/mips/configs/maltaup_defconfig
@@ -165,7 +165,6 @@ CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_CIFS=m
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 6697c5e6682f..bb549cb1c3e3 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -1022,7 +1022,6 @@ CONFIG_NFSD=m
 CONFIG_NFSD_V3_ACL=y
 CONFIG_NFSD_V4=y
 CONFIG_CIFS=m
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_UPCALL=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
diff --git a/arch/sh/configs/titan_defconfig b/arch/sh/configs/titan_defconfig
index ba887f1351be..cd5c58916c65 100644
--- a/arch/sh/configs/titan_defconfig
+++ b/arch/sh/configs/titan_defconfig
@@ -242,7 +242,6 @@ CONFIG_NFSD=y
 CONFIG_NFSD_V3=y
 CONFIG_SMB_FS=m
 CONFIG_CIFS=m
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_NLS_CODEPAGE_437=m
 CONFIG_NLS_ASCII=m
-- 
2.32.0

