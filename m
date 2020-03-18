Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACEFE18A1B6
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2020 18:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgCRRlh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 18 Mar 2020 13:41:37 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:40020 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgCRRlg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Mar 2020 13:41:36 -0400
Received: by mail-pj1-f66.google.com with SMTP id bo3so1505708pjb.5
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2020 10:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+3C2Jxxhr3Fr+QNugMvtsqXWRrlcrZp8cgZVUmeHq6g=;
        b=Eupvn9F4IuV64uIclKoKaUaiZVNZ6h6aMj155vDylT0wMP4LNdSoV6pm3ec7FrTfDB
         sHFZyzYpwYb/k8Xgf2vWBPuktIGlcC6M9vSi6bPruRcKrM+gAJ34wgCG7BRyGAmqXTKe
         aH0tnCzGGeo8GZO0QzmaOPKTq9ERO0gNqzYh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+3C2Jxxhr3Fr+QNugMvtsqXWRrlcrZp8cgZVUmeHq6g=;
        b=cPlVp5IxaVENg8ks2wvydJMruv3IOlDiBXyHaHSLMTtfOZzb0hhAahlcMu9g17ExXj
         T+FvmgMuexPjgPjoL1wbUNJnuBHgiyH5CoDen7h483J606m+QM4/RknCN0/Gl7IBJx8U
         XApd9Cq17kAWcLFv3VvSytubJ2ruwZrrmKh8CS+/D34pdBgjaVYLJ/vGGtZ3UzwWWVJf
         3c/CWNt/Ct1brEOw7K7GyNQkeMFkI83eXPM8gJfIxJXzOdGoZj9g1OfkZZD9OtLStuBS
         vEo+AHWD4JbnY8Fx8HFvAMWsl7mcW6FCK54aNSiH+G0Sb3+s8Z/AUoF5Ah5KyvCVvr51
         WZvQ==
X-Gm-Message-State: ANhLgQ1z54mWcsFmafnRs1qfuIiacu5sM3gST5MYTZlT4HU3eG8m9pNH
        omh1PlvmDqe+olAJX3eVbiIDNA==
X-Google-Smtp-Source: ADFU+vtoC83g4l9CYEO9DuSWjIYqVr4aYu70n80LmX1yY5WMAy84TZuRBaoA24wi9GWWrTMG6Dkqmg==
X-Received: by 2002:a17:902:6bc3:: with SMTP id m3mr5041308plt.27.1584553295464;
        Wed, 18 Mar 2020 10:41:35 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k5sm2934127pju.29.2020.03.18.10.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 10:41:35 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 1/2] docs: locking: Add 'need' to hardirq section
Date:   Wed, 18 Mar 2020 10:41:32 -0700
Message-Id: <20200318174133.160206-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200318174133.160206-1-swboyd@chromium.org>
References: <20200318174133.160206-1-swboyd@chromium.org>
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
-- 
Sent by a computer, using git, on the internet

