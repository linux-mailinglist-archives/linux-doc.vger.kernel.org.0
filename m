Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9FD8446673
	for <lists+linux-doc@lfdr.de>; Fri,  5 Nov 2021 16:50:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232592AbhKEPwk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 5 Nov 2021 11:52:40 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:42542
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233676AbhKEPwj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Nov 2021 11:52:39 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 48B8C3F1E9
        for <linux-doc@vger.kernel.org>; Fri,  5 Nov 2021 15:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636127399;
        bh=O16OdHn+GTs4ijs6PH3u89m4wmvvKfK54fa2lozmRZs=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=wMXJkKo85eDHCektuoYL6K/FwhCJ7vtpMd3O+KWr7hrHUI5pYA/VqSf7RjRhSjlHI
         3ZRqYMPSiyyqokxe7sEYLViWgVEglVuyggjC4WL9gG2y/f5zy7FkOV2IJ8IPsid7Ke
         UNNPJpug3V3cCOxuvGj4+whwQNYieuppObGUO3D+vQ/luuyaPZkNWxdpNeEuZ/MG4Y
         EIJsbFboqWa4nskx7LKTb7y9sxZ3n1z8cK39BEndCFwXh4Ga3Nzayj2UhrmBRh++O3
         A4y2JGgpqCGR319Ox4r4UF1YbaLjVTErpAecKDLZ8hm4uKXWJdwxH1n7StTk7cQCjC
         W4mybHNQW6vnA==
Received: by mail-ed1-f72.google.com with SMTP id t20-20020a056402525400b003e2ad6b5ee7so9266741edd.8
        for <linux-doc@vger.kernel.org>; Fri, 05 Nov 2021 08:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O16OdHn+GTs4ijs6PH3u89m4wmvvKfK54fa2lozmRZs=;
        b=UraBhEiUElN/UDdVbIPTm4NJDQxHiKFz2l55s6GTVth9nyfnyyUvHYnCB5CzBFh2sP
         GUsxwiQChpE+xyHva8USa7ct5XOD83Vk9XPHlo3abry9gjc75kU8XcqHgb8maPLU5uNX
         XqaFavItlJ1rkQh9waPqmFf0nxCG0oOSHOFIST7C3g1sbRqo9zsibclDED26MIXMpkas
         4UZhh/tW5c0tqe552YK8Onkl72VS0gKiQ8L9vmRlL2uSRWSNC/4XcRq0H31fK96ENq0E
         P8ZtPshcTKsOUNLmKMLVvkYxt0kKX1aaz1Vc2YObv7pLs+5WrsH/rPoq3yIAD3N0d8oZ
         0O1g==
X-Gm-Message-State: AOAM5303TpYoErnZTWHya4kYq7NwIu12b61cubykf31v0GACX+yRoogW
        V4cja4RkxWFD3r8Lqz+xo2lNiw6LfQgC0adKPTVFB+fAA0rF4MJSs4/8p9Hg9TeKcqyrqRsxTqb
        BlVEQw4jvZ5uBK6ca5oIsXzBPLcoLlJzUcMpd4Q==
X-Received: by 2002:a5d:4a0a:: with SMTP id m10mr51023055wrq.221.1636127388423;
        Fri, 05 Nov 2021 08:49:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwY603x0zr+Chuyb1t2ADL8WGsBiGEq/MpdSLq2l9mjdNq6e20HunukFRMlsP5KMMQo9T/EOQ==
X-Received: by 2002:a5d:4a0a:: with SMTP id m10mr51023001wrq.221.1636127388217;
        Fri, 05 Nov 2021 08:49:48 -0700 (PDT)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
        by smtp.gmail.com with ESMTPSA id o25sm8150426wms.17.2021.11.05.08.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 08:49:47 -0700 (PDT)
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
Subject: [PATCH 6/7] include: mfd: Remove leftovers from bd70528 watchdog
Date:   Fri,  5 Nov 2021 16:43:33 +0100
Message-Id: <20211105154334.1841927-7-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This driver was removed so remove all references to it.

Fixes: 52a5502507bc ("watchdog: bd70528 drop bd70528 support")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 include/linux/mfd/rohm-bd70528.h | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/include/linux/mfd/rohm-bd70528.h b/include/linux/mfd/rohm-bd70528.h
index 4a5966475a35..297a4a84fff5 100644
--- a/include/linux/mfd/rohm-bd70528.h
+++ b/include/linux/mfd/rohm-bd70528.h
@@ -362,28 +362,4 @@ enum {
 #define BD70528_MASK_BUCK_RAMP 0x10
 #define BD70528_SIFT_BUCK_RAMP 4
 
-#if IS_ENABLED(CONFIG_BD70528_WATCHDOG)
-
-int bd70528_wdt_set(struct rohm_regmap_dev *data, int enable, int *old_state);
-void bd70528_wdt_lock(struct rohm_regmap_dev *data);
-void bd70528_wdt_unlock(struct rohm_regmap_dev *data);
-
-#else /* CONFIG_BD70528_WATCHDOG */
-
-static inline int bd70528_wdt_set(struct rohm_regmap_dev *data, int enable,
-				  int *old_state)
-{
-	return 0;
-}
-
-static inline void bd70528_wdt_lock(struct rohm_regmap_dev *data)
-{
-}
-
-static inline void bd70528_wdt_unlock(struct rohm_regmap_dev *data)
-{
-}
-
-#endif /* CONFIG_BD70528_WATCHDOG */
-
 #endif /* __LINUX_MFD_BD70528_H__ */
-- 
2.32.0

