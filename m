Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB109476E49
	for <lists+linux-doc@lfdr.de>; Thu, 16 Dec 2021 10:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233437AbhLPJvO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 16 Dec 2021 04:51:14 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:50574
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233453AbhLPJvO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Dec 2021 04:51:14 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5EC963F1C0
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 09:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639648273;
        bh=0bEssfmXxHPGUprNSso7Mjq6wm8EF4TYvKsU8/02BBE=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=vxPigpH2yReb3f57rd7UVMemz4Hvi84byPqncoJH7GqFQNVH95Ce3zXHmx0ctpJob
         3SEtCSpwORnuzU5g4pEjgbKl8ud3o4dKtSXdKxcnJ2m/3voi0JbxSb1bFJCJD6AIhg
         D/E/nzsNpHtEgGLqhEohSd4bUYuBf+K6Np4iEpgyqHPHtizH5k64/6MP5ZfK4wdxVI
         yg9q5uFXPYBOXYSnswTiDnSMBFKJsjtNVqeOCQvzEoHc+c7xEJTO1glRj0CmLN0i6D
         2NkqlmNOz5/Ks0hBabiSHXz+jT/oagWJx87E9nIVdO/7j23Jfg1PRMxyrFrFhLBLvq
         gAXMjNO5nAxVw==
Received: by mail-wm1-f71.google.com with SMTP id j25-20020a05600c1c1900b00332372c252dso10076343wms.1
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 01:51:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0bEssfmXxHPGUprNSso7Mjq6wm8EF4TYvKsU8/02BBE=;
        b=IVaewK+GoEDLwGxea7p67UHUlMIddwNyTm0svOq5jAEZXNvkRsXGn0n01eJpZ8QIvL
         yyKj/EX88HHg3oNBZ9SuZdosVuF6muJpUlNRK/SJ68z7AkpUKhPtaDajpVX3KOs29iGK
         4pa6MDzK67hy6UcdtCWomVpmrLurgeIqp9px+BTXykCNgYgBM5F/w1xg2mmIkLMQjV+X
         YDn4lghQVFF8G+RkUW6db6UFpXOn4AbNJ5oLSCTvXMHJftY4+DZ2ByL0B/NGIXThEnKt
         4bu4jtccygR5dZfRvnuUJvrso6EmR/NA1UOHg+/qo4bwV7786G44NEd8zGTn245q91Yd
         9R+A==
X-Gm-Message-State: AOAM5303GZ0XcrAdy0cE8782ZBLChTCuTu0vIuycSnMg8wGnNPlV6d/6
        0hMfcqLk7ij0/hReSLrzwp+1jjExbtBAp3PoFB/7U4NW496PBcUXfFbxH8aj2Nxnwfi1yeSH195
        ueEp6Oh6+J/lwpD/SXguPCq2K3AvsVa0Z2gu7rA==
X-Received: by 2002:adf:e0c7:: with SMTP id m7mr8388280wri.530.1639648261837;
        Thu, 16 Dec 2021 01:51:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbJdsw74e1MWIrtUpFfSGPgTM99V/z0uqkAiMvhK7tPz89ydRhYflRK8+9nZRMh9H4fPR73w==
X-Received: by 2002:adf:e0c7:: with SMTP id m7mr8388260wri.530.1639648261695;
        Thu, 16 Dec 2021 01:51:01 -0800 (PST)
Received: from alex.home (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr. [90.112.158.1])
        by smtp.gmail.com with ESMTPSA id a1sm5552974wri.89.2021.12.16.01.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 01:51:01 -0800 (PST)
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
Subject: [PATCH v2 6/6] arch: Remove leftovers from prism54 wireless driver
Date:   Thu, 16 Dec 2021 10:44:26 +0100
Message-Id: <20211216094426.2083802-7-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
References: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This driver was removed so remove all references to it.

Fixes: d249ff28b1d8 ("intersil: remove obsolete prism54 wireless driver")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/mips/configs/ip27_defconfig        | 1 -
 arch/mips/configs/malta_defconfig       | 1 -
 arch/mips/configs/malta_kvm_defconfig   | 1 -
 arch/mips/configs/maltaup_xpa_defconfig | 1 -
 arch/powerpc/configs/pmac32_defconfig   | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/mips/configs/ip27_defconfig b/arch/mips/configs/ip27_defconfig
index 638d7cf5ef01..821630ac1be7 100644
--- a/arch/mips/configs/ip27_defconfig
+++ b/arch/mips/configs/ip27_defconfig
@@ -223,7 +223,6 @@ CONFIG_TMD_HERMES=m
 CONFIG_NORTEL_HERMES=m
 CONFIG_P54_COMMON=m
 CONFIG_P54_PCI=m
-CONFIG_PRISM54=m
 CONFIG_LIBERTAS=m
 CONFIG_LIBERTAS_THINFIRM=m
 CONFIG_MWL8K=m
diff --git a/arch/mips/configs/malta_defconfig b/arch/mips/configs/malta_defconfig
index 9cb2cf2595e0..3321bb576944 100644
--- a/arch/mips/configs/malta_defconfig
+++ b/arch/mips/configs/malta_defconfig
@@ -302,7 +302,6 @@ CONFIG_HOSTAP_FIRMWARE=y
 CONFIG_HOSTAP_FIRMWARE_NVRAM=y
 CONFIG_HOSTAP_PLX=m
 CONFIG_HOSTAP_PCI=m
-CONFIG_PRISM54=m
 CONFIG_LIBERTAS=m
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_MOUSE_PS2_ELANTECH=y
diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/malta_kvm_defconfig
index 5924e48fd3ec..009b30372226 100644
--- a/arch/mips/configs/malta_kvm_defconfig
+++ b/arch/mips/configs/malta_kvm_defconfig
@@ -310,7 +310,6 @@ CONFIG_HOSTAP_FIRMWARE=y
 CONFIG_HOSTAP_FIRMWARE_NVRAM=y
 CONFIG_HOSTAP_PLX=m
 CONFIG_HOSTAP_PCI=m
-CONFIG_PRISM54=m
 CONFIG_LIBERTAS=m
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_SERIAL_8250=y
diff --git a/arch/mips/configs/maltaup_xpa_defconfig b/arch/mips/configs/maltaup_xpa_defconfig
index c0d3156ef640..e214e136101c 100644
--- a/arch/mips/configs/maltaup_xpa_defconfig
+++ b/arch/mips/configs/maltaup_xpa_defconfig
@@ -309,7 +309,6 @@ CONFIG_HOSTAP_FIRMWARE=y
 CONFIG_HOSTAP_FIRMWARE_NVRAM=y
 CONFIG_HOSTAP_PLX=m
 CONFIG_HOSTAP_PCI=m
-CONFIG_PRISM54=m
 CONFIG_LIBERTAS=m
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_MOUSE_PS2_ELANTECH=y
diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index 7aefac5afab0..13885ec563d1 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -169,7 +169,6 @@ CONFIG_USB_USBNET=m
 CONFIG_B43=m
 CONFIG_B43LEGACY=m
 CONFIG_P54_COMMON=m
-CONFIG_PRISM54=m
 CONFIG_INPUT_EVDEV=y
 # CONFIG_KEYBOARD_ATKBD is not set
 # CONFIG_MOUSE_PS2 is not set
-- 
2.32.0

