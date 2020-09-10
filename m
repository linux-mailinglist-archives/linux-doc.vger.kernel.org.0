Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABF47263CCF
	for <lists+linux-doc@lfdr.de>; Thu, 10 Sep 2020 07:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbgIJFyu (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Sep 2020 01:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbgIJFwt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Sep 2020 01:52:49 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26AEBC061796
        for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2020 22:52:49 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t14so3632034pgl.10
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2020 22:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FsIW/ho8L4Ojj2IDAYo7OECYT4O745qVEpU9yUHFZV4=;
        b=MUKmoyzyhN/Cs3Rrq1Zdyc+ZXljXzU17JtJoK7tt7EhY2zjmydEvAEdoUilWiG4OIP
         ZvEfG3JqLV/ESzNS3UVvYWyOg4U+F4dKJ8vgT5ZN/kOU3BWNgq+/1talwqrbFy+8itD9
         RVVrFjyMSVJxfOXgr2a7bRO911UbgiSzstJMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FsIW/ho8L4Ojj2IDAYo7OECYT4O745qVEpU9yUHFZV4=;
        b=L6Eb1ZSzEmvbKqJryCvVgWznltez9XGCqdDH9R4R3L3ItUYoLUBSbDeB+hL8o0Zk43
         s94lndT4q+RWdu88BcpDwx1dghc2xol5gs+pT8cPXtJV14XufZte4JGJy9UkRnCJbZG8
         p5FoB4/w+OJUo9o0UYpt/gyvXIJef+53SNod4X0HntV+7KYWjPbjXAKqopL/rautB7lt
         D4Xr3OpgsrXl9vTHT2Bb8J4eENAB88QP3T3xQ9erGJ55mI+s1Aeft/e3kFejDLvstqwl
         008YcRf4GIhrIejceO56Dhxi8FX/9Wr7ymh32UZO2DWy/tpd8Yzhi52CLq86hYe2pbIX
         2wYw==
X-Gm-Message-State: AOAM531DWlyGJQ50qAZXFLRCRnrIzQNlwXC0lizUWD/ArxacloTPghC9
        VezRakjd8TJ4kfJ7ZxNZd8h/sQ==
X-Google-Smtp-Source: ABdhPJxD/X0Fha0s2xRDikF0PErw7bhDDnyMalvLpV36hPm1bPOvlo5pCV5aqb5HwYvlvmJcInSruQ==
X-Received: by 2002:aa7:8812:0:b029:13c:1611:6537 with SMTP id c18-20020aa788120000b029013c16116537mr3883052pfo.9.1599717168704;
        Wed, 09 Sep 2020 22:52:48 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id j11sm3751317pgh.8.2020.09.09.22.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 22:52:48 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        Tri Vo <trong@android.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 2/2] idr: Document that ida_simple_{get,remove}() are deprecated
Date:   Wed,  9 Sep 2020 22:52:46 -0700
Message-Id: <20200910055246.2297797-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200910055246.2297797-1-swboyd@chromium.org>
References: <20200910055246.2297797-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

These two functions are deprecated. Users should call ida_alloc() or
ida_free() respectively instead. Add documentation to this effect until
the macro can be removed.

Cc: Greg KH <gregkh@linuxfoundation.org>
Reviewed-by: Tri Vo <trong@android.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 include/linux/idr.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/idr.h b/include/linux/idr.h
index b235ed987021..a0dce14090a9 100644
--- a/include/linux/idr.h
+++ b/include/linux/idr.h
@@ -314,6 +314,10 @@ static inline void ida_init(struct ida *ida)
 	xa_init_flags(&ida->xa, IDA_INIT_FLAGS);
 }
 
+/*
+ * ida_simple_get() and ida_simple_remove() are deprecated. Use
+ * ida_alloc() and ida_free() instead respectively.
+ */
 #define ida_simple_get(ida, start, end, gfp)	\
 			ida_alloc_range(ida, start, (end) - 1, gfp)
 #define ida_simple_remove(ida, id)	ida_free(ida, id)
-- 
Sent by a computer, using git, on the internet

