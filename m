Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0421B18956B
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2020 06:46:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbgCRFo2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 18 Mar 2020 01:44:28 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:32951 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgCRFo2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Mar 2020 01:44:28 -0400
Received: by mail-pf1-f193.google.com with SMTP id n7so13299546pfn.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2020 22:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qXY2yMRGwktYokk3pPFwmmTxw2SIkRhzk6Ye/AepEnM=;
        b=auMuif27BF2tfyRqSNTt4zSVURfB7x5ZyhtvFy0jfEjowqXES6bMXaYbo9Rcjq9sOO
         NkXoBSCwuP0ZDQF4xMbnZXE2eiWzYeLKBPHB0T+1ep2X1MfnosDT4wsHaJ9PVplBUgph
         5joOAvaRgGFjqKtAtGLxOd6crzo+aegDG7PVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qXY2yMRGwktYokk3pPFwmmTxw2SIkRhzk6Ye/AepEnM=;
        b=FgIxAm9JGl9gteed22ys0aa1pCYc5qSOF8vkrt8yDHpDJCpAX9US+h3XB7Tk1PI1sO
         RiPn5C5pGhbLuCKdAQsKT7S3Awjf/Nj+XNmX50eTHSyqUnrXT/2GAhpbFrr+7NzhPmey
         KNp+WIY2IqJZujChf0V0sYURhGLLkggvWjTWz4OkI2tDgR8sctxj7IDpAG0ZbV4S6hSb
         UIJVt/av+Zt04lX2ufvlBGT4CTh1OYvZ2XJEy8tn7ZhHiJA5IOReXbwneU/mbo3J9rAd
         lJG0AA2g1iHT0BX3BKcnlOFJYpA1WDoS/N748PsooCunj4Dg36oopx/rM5XiMlke04jF
         jmHQ==
X-Gm-Message-State: ANhLgQ3KF5QjUyPB9TKoTSGL8tV5WyzVJpeuU4Ak59qF1BrRqHOV6a7m
        m31hmwzK3sfT3f3k5lqHP0wOuA==
X-Google-Smtp-Source: ADFU+vsYBFmDXYadiM2XWYH/z8MFjrQ3chr28RyzZ4TN+iHPIz4KZzaFkI1eus8KAFNzwyVqrvROsA==
X-Received: by 2002:a65:458e:: with SMTP id o14mr2875894pgq.323.1584510266817;
        Tue, 17 Mar 2020 22:44:26 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e11sm5005003pfj.95.2020.03.17.22.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 22:44:26 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] docs: locking: Add 'need' to hardirq section
Date:   Tue, 17 Mar 2020 22:44:25 -0700
Message-Id: <20200318054425.111928-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the missing word to make this sentence read properly.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 Documentation/kernel-hacking/locking.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index a8518ac0d31d..9850c1e52607 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -263,7 +263,7 @@ by a hardware interrupt on another CPU. This is where
 interrupts on that cpu, then grab the lock.
 :c:func:`spin_unlock_irq()` does the reverse.
 
-The irq handler does not to use :c:func:`spin_lock_irq()`, because
+The irq handler does not need to use :c:func:`spin_lock_irq()`, because
 the softirq cannot run while the irq handler is running: it can use
 :c:func:`spin_lock()`, which is slightly faster. The only exception
 would be if a different hardware irq handler uses the same lock:

base-commit: fb33c6510d5595144d585aa194d377cf74d31911
-- 
Sent by a computer, using git, on the internet

