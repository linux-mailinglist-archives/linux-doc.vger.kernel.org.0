Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43CA9168AA3
	for <lists+linux-doc@lfdr.de>; Sat, 22 Feb 2020 01:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729666AbgBVACn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 21 Feb 2020 19:02:43 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:36333 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbgBVACn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Feb 2020 19:02:43 -0500
Received: by mail-pj1-f66.google.com with SMTP id gv17so1493043pjb.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2020 16:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=mlYJKghLuJvyIb9vTdDK73ZdLUo5D/iUeEEKRshNNdU=;
        b=F813bmehcWyoOKuLB18kNU/7ag9mgf6iNgkmwDBMt+nd7w/qt4bb4Y7NfrgdZTKpMr
         vhmFYAxnKpi/Q83QSAVGa7QcTSDT7gK/MjCjhYPRmAJnlHwKkbLcmShXoDGHwMbyFVy8
         Mkc+WoOMGkd3oB1FOM5O1Clm9mkoMRmedmpPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=mlYJKghLuJvyIb9vTdDK73ZdLUo5D/iUeEEKRshNNdU=;
        b=UNEBtP1O9D88zt3uGvrHU82ffY5Hq6ZWE0xvgEEJTE3mhKvP9EqTRaZdmCp3U6Z4Vr
         o4GJJGP3UvAUfWtUYlVWCFFDHfqfX73JFHRj9cn9/LsVQHCVVTK+t4vMGWSu8OzcNK39
         w9gNqAkHtypI1UHA36YHl8O7P1w+MeXK3r/EqwtSRagxtxw/BB3hAJPa6VaYK1iG2Q43
         JXjBtJLHFOSCeQ0cM96etzgd0ExrKta3tpLzfMKTkEIz4xuw7QP6A3hlrCjmr8fNUX1u
         4r2AKMXmen6Gxd0wy/wyHllB56BlIGZ69cKeEj/RrdeV3l4cPDXxFVctYh/UlCghzaTf
         w0Sg==
X-Gm-Message-State: APjAAAXiYP3CkK+5w6eVHh96wlVT6tL+iou0BLUXzm7FcylOE4q5JA8a
        pzl0FjXynk12XRG8rSedRk/Yig==
X-Google-Smtp-Source: APXvYqxWXDVzmbnMKsqNsGng+5nphCWKQ4pTyJ3j6HWshT/R2zSiILwT7bURopmZ9Z+CNal2PtMHxA==
X-Received: by 2002:a17:90a:ba91:: with SMTP id t17mr6127308pjr.74.1582329762627;
        Fri, 21 Feb 2020 16:02:42 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l11sm3574354pgt.59.2020.02.21.16.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 16:02:41 -0800 (PST)
Date:   Fri, 21 Feb 2020 16:02:39 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] docs: Fix empty parallelism argument
Message-ID: <202002211601.322B596B@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When there was no parallelism (no top-level -j arg and a pre-1.7
sphinx-build), the argument passed would be empty ("") instead of just
being missing, which would (understandably) badly confuse sphinx-build.
Fix this by removing the quotes.

Reported-by: Rafael J. Wysocki <rafael@kernel.org>
Fixes: 51e46c7a4007 ("docs, parallelism: Rearrange how jobserver reservations are made")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/sphinx/parallel-wrapper.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sphinx/parallel-wrapper.sh b/Documentation/sphinx/parallel-wrapper.sh
index 7daf5133bdd3..e54c44ce117d 100644
--- a/Documentation/sphinx/parallel-wrapper.sh
+++ b/Documentation/sphinx/parallel-wrapper.sh
@@ -30,4 +30,4 @@ if [ -n "$parallel" ] ; then
 	parallel="-j$parallel"
 fi
 
-exec "$sphinx" "$parallel" "$@"
+exec "$sphinx" $parallel "$@"
-- 
2.20.1


-- 
Kees Cook
