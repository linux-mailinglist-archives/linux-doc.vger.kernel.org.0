Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06DBC233877
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jul 2020 20:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730242AbgG3ShM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 30 Jul 2020 14:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730250AbgG3ShI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Jul 2020 14:37:08 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A61C061756
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2020 11:37:08 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a9so4969658pjd.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2020 11:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=48EaftfzmTZBLmMkFzdUMojMZdIQcbrAnw8qi2t2H4o=;
        b=BMqbLaymOrzJinMUG/wVdMBlECk2GjzePlH+34gGt3CbM/banratdk08A5J901lIVo
         uIoSW1FSZJ2Ecj3crkTgAY28lnxvsLrF5xAaE5QhTucCOmYUbjezhboBRmz2wMG6Udmt
         wzOtsncO0fjgHOv9WS9AMpGPCn1HNE0MQq41w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=48EaftfzmTZBLmMkFzdUMojMZdIQcbrAnw8qi2t2H4o=;
        b=BMZl+I7QJPIlZd7+KoJ83S8QEZDjWwPD0Jp6Du5/mfA0+ZhbS4G4R+CkSXe7aMC82v
         F8HaqHyRNZwcVPil5b6+5jnPDMScQUB8JP8wTOxj8pIf/CeWtooKrR46CfzHAnJXxneg
         SwjA3WudVIJ8gMtmQFNCgP2CzSM1v1EscFhWGtVWmTjYaAKZxpUdm8whlgO4+lWTXjoG
         2+E6Kp5iNyOhOqrd44YI1fORdOvNKW7tBvTdWRrydgnENxvgiOhc7kEKTkr2dmlZhyli
         Pm6poVVG4bbp1fdEx6E6wB171+IyQ73EMSUL3o1HXXn6dLRrodzpSdR7DJFlbwpwa4AU
         j4LQ==
X-Gm-Message-State: AOAM532Nd7M79rPhKB3WuBaJNLlHRAyYMjzXfZiVBloctGNDCsAm7Sm1
        LgXt9OeZSvxRge7BMD3XYrxbzA==
X-Google-Smtp-Source: ABdhPJzDKESIkF8QnQ2VFqDc+mBNrDD0slry5sD+djVWxhFRRzlCggy9/6M7ixiBMSS5srYub+xAbA==
X-Received: by 2002:a62:7b4e:: with SMTP id w75mr320065pfc.130.1596134227382;
        Thu, 30 Jul 2020 11:37:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f6sm7515046pfa.23.2020.07.30.11.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 11:37:05 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Kees Cook <keescook@chromium.org>,
        WeiXiong Liao <gmpy.liaowx@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mailmap: Add WeiXiong Liao
Date:   Thu, 30 Jul 2020 11:37:02 -0700
Message-Id: <20200730183702.702552-3-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200730183702.702552-1-keescook@chromium.org>
References: <20200730183702.702552-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

WeiXiong Liao noted to me offlist that his preference for email address
had changed and that he'd like it updated in the mailmap so people
discussing pstore/blk would be able to reach him.

Cc: WeiXiong Liao <gmpy.liaowx@gmail.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 4e6c169719df..9a3e9b68c430 100644
--- a/.mailmap
+++ b/.mailmap
@@ -296,6 +296,7 @@ Vivien Didelot <vivien.didelot@gmail.com> <vivien.didelot@savoirfairelinux.com>
 Vlad Dogaru <ddvlad@gmail.com> <vlad.dogaru@intel.com>
 Vladimir Davydov <vdavydov.dev@gmail.com> <vdavydov@parallels.com>
 Vladimir Davydov <vdavydov.dev@gmail.com> <vdavydov@virtuozzo.com>
+WeiXiong Liao <gmpy.liaowx@gmail.com> <liaoweixiong@allwinnertech.com>
 Will Deacon <will@kernel.org> <will.deacon@arm.com>
 Wolfram Sang <wsa@kernel.org> <w.sang@pengutronix.de>
 Wolfram Sang <wsa@kernel.org> <wsa@the-dreams.de>
-- 
2.25.1

