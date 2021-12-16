Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF246476E1F
	for <lists+linux-doc@lfdr.de>; Thu, 16 Dec 2021 10:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbhLPJtB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 16 Dec 2021 04:49:01 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51240
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229905AbhLPJtB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Dec 2021 04:49:01 -0500
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A8F743FFD8
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 09:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639648139;
        bh=WUEOV0Puf0rdsNKOWUqNq9jf3IbOHS9FDzqSlVW9pZ4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=nZxEyNNZHWjS7EkYXH7Krd5iNaR7s1Ld2Hxs6evJ3tRaGBRhKwm48gmY3aKeS9UMd
         BqQPgTP6wqHzmb5j3ahhpwUICm2xNlPuQnvqjzvnyvpDOoupfPmPK6l1kTha70OQQN
         fwJI6wjrIuAJMtYe0O4g7k2RevogUJYIUTJvBi2HqpdftM+u7HrdyKXcDgkLQmQoKk
         O6aFyDPAg/PEzh0NiwFzKVablM4JfmMhWQzhyrVwToagjibsgJSHXwhSwOFrx2Q1od
         yMkobQcaZrx0EEUZ5EXIT58wNQ9OWG7WC/farrSafyGg4gYluCeRN3mlIxGfit/2Ih
         yQU/aWWARSiWg==
Received: by mail-wr1-f71.google.com with SMTP id s23-20020adf9797000000b001a24674f0f7so293578wrb.9
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 01:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WUEOV0Puf0rdsNKOWUqNq9jf3IbOHS9FDzqSlVW9pZ4=;
        b=ICQS2/z+aLY8F6eO6KPTp7eFOAnNvnmM3oAzy0alpKD+VW9XKcExkYyl6dV6zV0xc9
         hnJEqVlrnC5VNAxmdYCAKprKTAjoslpJ3k4MPjUUR20HgbM2RpRJQNrS8ZibbmRnGsiP
         +j8VWRFJQ0GYtVckLWX6gfWjUba9WO1vRSoVZmHMSploNmrKLbJCaNFQkqI4GIixGqf+
         ZlOVHf1IfQlfiQzMcs2oIZvhq3ZLn9L37XXLdsHMi6MJZ3rICXnfn3EMb7N8qI9oc+gd
         TH/h3OK4IpIH6zX5FubJPloH3IAnKG0pFMYQ7jswZ/xanFJWN/OdkfrQuGRumu+IUx+h
         d7JQ==
X-Gm-Message-State: AOAM530xeRZrdaw2NnO3AWNtdeB09t/rZ8OG1PjzDXtlw4v4M8MK/EQa
        A41ZLi8+erk8LjDoGrNxo+sICALjhk0KTH4MQ93U1xFw2G7yp7IPQ5oDLHncKNNOXQ4f80UyFBz
        PAgNp2FZA+o7rMmsQf0K7a1mfS+TT7W5AKntH7w==
X-Received: by 2002:a5d:69c5:: with SMTP id s5mr8274604wrw.283.1639648139311;
        Thu, 16 Dec 2021 01:48:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4D7RcuSiJhn58Bkp9nDVxQgFgFxFbQZtRi6SJVIaJvvuUPrIa3b5F/cBoS8baOoKUv8xnUw==
X-Received: by 2002:a5d:69c5:: with SMTP id s5mr8274584wrw.283.1639648139155;
        Thu, 16 Dec 2021 01:48:59 -0800 (PST)
Received: from alex.home (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr. [90.112.158.1])
        by smtp.gmail.com with ESMTPSA id m36sm4145891wms.25.2021.12.16.01.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 01:48:58 -0800 (PST)
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
Cc:     Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v2 4/6] arch: Remove leftovers from mandatory file locking
Date:   Thu, 16 Dec 2021 10:44:24 +0100
Message-Id: <20211216094426.2083802-5-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
References: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This config was removed so remove all references to it.

Fixes: f7e33bdbd6d1 ("fs: remove mandatory file locking support")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 arch/mips/configs/decstation_64_defconfig  | 1 -
 arch/mips/configs/decstation_defconfig     | 1 -
 arch/mips/configs/decstation_r4k_defconfig | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/mips/configs/decstation_64_defconfig b/arch/mips/configs/decstation_64_defconfig
index 85f1955b4b00..e2ed105f8c97 100644
--- a/arch/mips/configs/decstation_64_defconfig
+++ b/arch/mips/configs/decstation_64_defconfig
@@ -144,7 +144,6 @@ CONFIG_EXT2_FS_SECURITY=y
 CONFIG_EXT3_FS=y
 CONFIG_EXT3_FS_POSIX_ACL=y
 CONFIG_EXT3_FS_SECURITY=y
-# CONFIG_MANDATORY_FILE_LOCKING is not set
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
 CONFIG_PROC_KCORE=y
diff --git a/arch/mips/configs/decstation_defconfig b/arch/mips/configs/decstation_defconfig
index 30a6eafdb1d0..7e987d6f5e34 100644
--- a/arch/mips/configs/decstation_defconfig
+++ b/arch/mips/configs/decstation_defconfig
@@ -140,7 +140,6 @@ CONFIG_EXT2_FS_SECURITY=y
 CONFIG_EXT3_FS=y
 CONFIG_EXT3_FS_POSIX_ACL=y
 CONFIG_EXT3_FS_SECURITY=y
-# CONFIG_MANDATORY_FILE_LOCKING is not set
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
 CONFIG_PROC_KCORE=y
diff --git a/arch/mips/configs/decstation_r4k_defconfig b/arch/mips/configs/decstation_r4k_defconfig
index e2b58dbf4aa9..6df5f6f2ac8e 100644
--- a/arch/mips/configs/decstation_r4k_defconfig
+++ b/arch/mips/configs/decstation_r4k_defconfig
@@ -140,7 +140,6 @@ CONFIG_EXT2_FS_SECURITY=y
 CONFIG_EXT3_FS=y
 CONFIG_EXT3_FS_POSIX_ACL=y
 CONFIG_EXT3_FS_SECURITY=y
-# CONFIG_MANDATORY_FILE_LOCKING is not set
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
 CONFIG_PROC_KCORE=y
-- 
2.32.0

