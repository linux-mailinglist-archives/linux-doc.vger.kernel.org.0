Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C224749AAF0
	for <lists+linux-doc@lfdr.de>; Tue, 25 Jan 2022 05:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387298AbiAYDrf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 24 Jan 2022 22:47:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1320696AbiAYDNz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Jan 2022 22:13:55 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04092C0604CF
        for <linux-doc@vger.kernel.org>; Mon, 24 Jan 2022 15:23:45 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id p37so17573342pfh.4
        for <linux-doc@vger.kernel.org>; Mon, 24 Jan 2022 15:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cd0cSzbqlGWMFGtUrHF/qt14iy77UQsuXoGWHNi86Ms=;
        b=iXzmxOcGE9j3Wc5NbiYRAm13F2IIUE3mn+buzoErc0JQmRa5Yp0xnR51eiYjcqIDtw
         wpo4bMu1RmCWVPVmv8+Kc1ggJtB1TWLM3VMJnhIhm/pB/HUpK5ysLKehT0p5x7pzk2Fe
         J4Y1+03lCGo60qbL3l86x8B5GSlF1AEZsVQBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cd0cSzbqlGWMFGtUrHF/qt14iy77UQsuXoGWHNi86Ms=;
        b=vXeAUzDYvFaYKB2BlChwFTZpqya+AKW7rAB++bjaaH07ezjQre1D13EdJCPVunQb1g
         w6oL+dNWY59VtnHBAMMt5JtxCzY5DgUTlmO3BPB4hEOA1vzbABl0F6s9I71G3OZ9mnJM
         SczdCMpVQMeTtBUV/211pF9nU6p/sgZwsRkHwB9pHSPW9J11okUYoeWocC/g/faYLxUV
         +OAMY4+aUqByfVnE8G292tk9qhIIkzoX3alr+t96aaPHovHGY3KPOboBQJya9qHzR6Pi
         MlyZmvvpJ+lGq9NIfQkKg/NCcX2p2gGcWdeETkHZGXxxxbYaEAMGZ9yz3THkZHmlmi0t
         U3Gw==
X-Gm-Message-State: AOAM53354an5jJIyxtjXZrc+GUJKFr3Kstq/v1VkUhW3ETZsJwAedjhC
        yS1etYSBrW4PYNaOzr3edJS6kw==
X-Google-Smtp-Source: ABdhPJw4fFZbTHJcKxFlrtgLXJyzrkucrW8728E5WGYpmNw4hkQ8hgTnDIBdZpw0gUd/vvwXPQVEBQ==
X-Received: by 2002:aa7:92c5:0:b0:4bd:9f44:9562 with SMTP id k5-20020aa792c5000000b004bd9f449562mr16161166pfa.80.1643066624431;
        Mon, 24 Jan 2022 15:23:44 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f13sm17888522pfc.70.2022.01.24.15.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 15:23:44 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leon@kernel.org>,
        Keith Busch <kbusch@kernel.org>, Len Baker <len.baker@gmx.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH v2 0/2] overflow: Implement size_t saturating arithmetic helpers
Date:   Mon, 24 Jan 2022 15:23:40 -0800
Message-Id: <20220124232342.3113350-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126; h=from:subject; bh=3g98AxTuMJo50x2uAnHNuJXT9s3Olm5uv7WW3MFAli4=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBh7zT98tWGoLQLp9kMHgyuIUDQVdNudI1AkfPnI0p0 /G9+4xOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYe80/QAKCRCJcvTf3G3AJvBpEA CfqRPP4L5Bp3r5ZTKtK+CpVvr8EwkcICcXyaYUGCVpWMytRO3dk3Kqzc4Vibs/IA9TK9WtC9nYd8oy 8jYkMi/WGjLsy6fOuVvm3nAuy1c7DPP8anXkPhw+haGKUhE3iHZ6kGC2Qrdb04ojMGklAMax+H4gMO 5ua1ZW6wBTll+OAD7XbhfIaKeCmk3EBzgnUKsKksV0J0dmzxfdaRpNa6mGwDAaaFcGuS9z/2LeHNzD X0DqkJ3OKMUazeEGpTAOjcz0D+op+nf7uK8LM21tRaznrV5t6ZK3k8rDZrUA291/Jbds3OZAG859gd kJUyZK2O8yjieqaB4Oiskec2uZMDu2oXktCGhOmKenkmEqAlAMK4b2jF3tL4zhMrB+pVA7VvrzTbJ/ AhgbO4amaPz3hPiWMVv0jECq6cOoLHRMs70jbt1HwGzXKUQQwoUSoZzujXu+5LvwdFb0fOIXSkS4iB AC1cn/fyc34xRFO29zyODL71srcfsSNFvnX4lE8DVwxv5jMqhyiKFCZ6dvW7+xTmd/zTXPooeI2vvi wIksZWjkd1EgepfFIPTL8nXy+HJRLzVZbTsrlzJ3BGjGBOMJNpsApkm8Nn8Dy/mXm7LREAaMHxkPvS pBuonMdJICA3H8Rf3sVDDJCXyV8B7F2vxzGzgJ1vph3F7BHF6vC2PPPBZydg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

While doing more array_size() scans on the kernel, and reviewing recent[1]
struct_size() work[2], it became clear we needed helpers to perform
composed saturating adds and multiplies. This creates those helpers and
updates the self tests to check them.

v1: https://lore.kernel.org/lkml/20210920180853.1825195-1-keescook@chromium.org/
v2:
 - use static inlines instead of macros (Rasmus)
 - undef local helpers defs in selftest (Rasmus)
 - Make sure to keep saturation for size_sub() arguments
 - update selftests for size_sub() behavior
 - Add reviews

Thanks,

-Kees

[1] https://lore.kernel.org/linux-hardening/202201241213.82E7D9F598@keescook/
[2] https://lore.kernel.org/lkml/?q=%22open-coded+arithmetic%22

Kees Cook (2):
  test_overflow: Regularize test reporting output
  overflow: Implement size_t saturating arithmetic helpers

 Documentation/process/deprecated.rst |  20 +++-
 include/linux/overflow.h             | 110 +++++++++++--------
 lib/test_overflow.c                  | 152 ++++++++++++++++++++++-----
 3 files changed, 214 insertions(+), 68 deletions(-)

-- 
2.30.2

