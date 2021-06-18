Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9A553AD5E8
	for <lists+linux-doc@lfdr.de>; Sat, 19 Jun 2021 01:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234394AbhFRXcw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 18 Jun 2021 19:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234322AbhFRXcw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Jun 2021 19:32:52 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF78C061767
        for <linux-doc@vger.kernel.org>; Fri, 18 Jun 2021 16:30:41 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id 2-20020a3709020000b02903aa9873df32so7019244qkj.15
        for <linux-doc@vger.kernel.org>; Fri, 18 Jun 2021 16:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=y0FcYdQ4+KG5bqQnhMUoT4g521uUABU2kMM30IGFQqQ=;
        b=SW5N62h7cVgnLw8sn5w9vwqcWBRPPNOtrLPwVXkkwehU/P/KI1k0v+xryMYEmvNcy7
         eMw36xbc1aj2sSJeMQHGZgrxcQ9RYBm3u20AqmA+6uDSt32RQAQnYcU+d6U3nC0czuC9
         YwbGbPjwt2FMq7fZNR0qZpKdkJVRW2bEIShhP5a6AxPQJNkMvIGn+po4SorZQM+vy2No
         syGYIVbxQfS+wI7cQsfflImJKZ36CzEYr2mghd13+LUS6F6K4zje94pul+gQYkXk8/xY
         XFLOEXPtaaiVCbbx2hX49XPYKtCPOVkU0HlmTFk7nsKts6eSL5g6qUXyR8j+NOdYhpny
         ToNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=y0FcYdQ4+KG5bqQnhMUoT4g521uUABU2kMM30IGFQqQ=;
        b=Nja+Bg0VFnTVbx3fBdbyMWTklqhFr5U9JTFQR6BcoiQ3+XnPTYFKbI/OM33x2VrTrc
         f865/87dI0NI0fo6DpB9RvkGTDk/duAM8HIKjk2N88k9LHF+YWrAko9fuJtc4iy0QLBW
         worm9cciAyhQHuSOGSQ7WYifRjiTK7rmopneClJehDpezxuVaByhEHYTjAPl/ZTeY877
         zxbmybFpQwVcfGEfU6DiT0Up3+Tx+sG8/3m3EsDTCyVlS0g1dm8IXnfTo8ZAqyKZeONQ
         rx8yvWtg09UW8aNOQ20ZYF76hA4URWCSloCcAG/TqHhzQYXd09CvGsHmuak8ZekFzaiz
         HScQ==
X-Gm-Message-State: AOAM533goAEYrbpGk+qmYlwEDmlQUCkA92Mwy3EsO2IEclh8jv/yz2qK
        i9I5VDYAiyZ3yVSBXD5YYMTlruzz0Mx4dT9aMoA=
X-Google-Smtp-Source: ABdhPJwUcNJUliDdacWIjJcGJ4s/bKZDYhicKYKFrpo1l2tFI+YXdpDCrUpbHwLtvy9f8tnHVJilKWWWlhkTRWPiYrw=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:7c41:e84c:8fcb:6664])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:f0d:: with SMTP id
 gw13mr8354593qvb.34.1624059040385; Fri, 18 Jun 2021 16:30:40 -0700 (PDT)
Date:   Fri, 18 Jun 2021 16:30:21 -0700
Message-Id: <20210618233023.1360185-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
Subject: [PATCH 0/2] no_profile fn attr and Kconfig for GCOV+PGO
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Martin Liska <mliska@suse.cz>, Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        johannes.berg@intel.com, linux-toolchains@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When we say noinstr, we mean noinstr.  GCOV and PGO can both instrument
functions. Add a new function annotation __no_profile that expands to
__attribute__((__no_profile__)) and Kconfig value
CC_HAS_NO_PROFILE_FN_ATTR.

Base is
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=for-next/clang/pgo.

Nick Desaulniers (2):
  compiler_attributes.h: define __no_profile, add to noinstr
  Kconfig: CC_HAS_NO_PROFILE_FN_ATTR, depend on for GCOV and PGO

 include/linux/compiler_attributes.h | 12 ++++++++++++
 include/linux/compiler_types.h      |  2 +-
 init/Kconfig                        |  3 +++
 kernel/gcov/Kconfig                 |  1 +
 kernel/pgo/Kconfig                  |  3 ++-
 5 files changed, 19 insertions(+), 2 deletions(-)


base-commit: 4356bc4c0425c81e204f561acf4dd0095544a6cb
-- 
2.32.0.288.g62a8d224e6-goog

