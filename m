Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF8A0168BAB
	for <lists+linux-doc@lfdr.de>; Sat, 22 Feb 2020 02:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727614AbgBVBk4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 21 Feb 2020 20:40:56 -0500
Received: from mail-pf1-f201.google.com ([209.85.210.201]:44218 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727984AbgBVBk4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Feb 2020 20:40:56 -0500
Received: by mail-pf1-f201.google.com with SMTP id r127so2340349pfc.11
        for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2020 17:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=dLJUCpK8J7QSv9pjJWTn5rjODL1aEvnJG2mu5Q6XKZg=;
        b=e/G2izCtRWiEex8vSlfihQZwWbRD38v38ILG4l4r0PBFW4nViuSsYy2XUvAta7Lg+H
         iwqAKMJhoSdeJvTXWCRNXcpv/oibXCTVqKiCZAtcZ/10EL22JqVpY311ZGjdWeCZ6TWl
         8dyvPrRs3TcgxxUs+km0ytcbrL8LP1G4CqJEc+oX/d3UX0nhbrwIbgTzLHjrUY9Qv0iT
         vMKmD8aus0eCRycaqJkgLLOPimbsn9TPbDIsjZfKcyaWKw7f7WfeukqDuKNG4mncrK8V
         XMYT45YusmnMzgHTM21b3xNOrzprNYN46RRF/MK+TTqfmcgndJlUtph86LKTOtFenFaQ
         uNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=dLJUCpK8J7QSv9pjJWTn5rjODL1aEvnJG2mu5Q6XKZg=;
        b=krvNuVbDeRl+m4NY7PJZSuItohEUjgD8tGtAiaCbcX9ycs7+Zncri3RrLRIS0fxLHp
         wvs266uRgrXzDYaPUsitNoG8/E4w+cmAcD+ClttNTUswD0n34NqQ159FOdL2VuuYWomM
         YSme5gj6TI0wAg8IbzbMVIAQFeOjYqoWtYY6DpZPusTM2nYvJv8DFvR2w1L7wdxNO8MG
         dIHT6lIchg3ViOyuZmZcU+ILiBDQdH1bUX+bPwWuFUz7Vl2jNvMCwTvERUFiLuZka9ud
         lJdtLyZNpRrTLYJm+zDAgRpI7oW4FA37mBSXBIxucQymVQZQZZMmL20uqtREPigYQ2bC
         xUQQ==
X-Gm-Message-State: APjAAAVJ81y7A8PZSw1xgSPuSOW/m0uiV6/nzvZ0wvtfgsX7Pe0dL861
        w7u2TlnbKo20m5MrvSb5lPXJX/xjA1Nogv4=
X-Google-Smtp-Source: APXvYqzesfXR7lGxs6e5jxSQUmuI+4SNQj8u282WnFoEoOOntmofH4HAOCXHvIB2dz4XXYHvKMvIdKicGMtW4q8=
X-Received: by 2002:a63:be48:: with SMTP id g8mr42416014pgo.23.1582335655195;
 Fri, 21 Feb 2020 17:40:55 -0800 (PST)
Date:   Fri, 21 Feb 2020 17:40:37 -0800
In-Reply-To: <20200222014038.180923-1-saravanak@google.com>
Message-Id: <20200222014038.180923-5-saravanak@google.com>
Mime-Version: 1.0
References: <20200222014038.180923-1-saravanak@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v1 4/5] of: property: Start using fw_devlink_get_flags()
From:   Saravana Kannan <saravanak@google.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-efi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The fw_devlink_get_flags() provides the right flags to use when creating
mandatory device links derived from information provided by the
firmware. So, use that.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index e851c57a15b0..15fc9315f1a7 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1262,7 +1262,7 @@ static int of_link_property(struct device *dev, struct device_node *con_np,
 	u32 dl_flags;
 
 	if (dev->of_node == con_np)
-		dl_flags = DL_FLAG_AUTOPROBE_CONSUMER;
+		dl_flags = fw_devlink_get_flags();
 	else
 		dl_flags = DL_FLAG_SYNC_STATE_ONLY;
 
-- 
2.25.0.265.gbab2e86ba0-goog

