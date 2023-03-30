Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBA5D6D0D7C
	for <lists+linux-doc@lfdr.de>; Thu, 30 Mar 2023 20:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbjC3SNs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 30 Mar 2023 14:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjC3SNr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Mar 2023 14:13:47 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF3CD516
        for <linux-doc@vger.kernel.org>; Thu, 30 Mar 2023 11:13:45 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id e18so19989910wra.9
        for <linux-doc@vger.kernel.org>; Thu, 30 Mar 2023 11:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google; t=1680200024;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8rBDKsgZ0c2Ea0fhfHATR3kgGwH9tv06KM69SIB7yXs=;
        b=bBsrNAMNDg2hmM1g5ZjEmgb4OtN2iPjzRQAn2q9/9UE+XsxVYH+8x3ewcsS2i1Cqqs
         tddFU2LH+8uz4LEejwQv6lqh2kRwiKseLyLPvzhScAjC1bntXWJijgiHsMAmNYXQ52lt
         yMpwvxwgZABQthiThFH0dG3QB8/iWbxFNFhhHUP/PJ6qqbI30R4RSMjVGT6dT/6YkeGs
         vLxjOlIgEioRIZ/9rNzkjMm4rXpjv215vNUhXMZsxXcw/Z4UPSaJ4Ofkqo5hvz5vZ1V0
         ZExrnBlTPNyJrSV3TjJYMc7BLf4K1Pj+ydhxizIWYG8n7DjsyMFKRgq0vjBpEhYnhnPJ
         0bIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680200024;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rBDKsgZ0c2Ea0fhfHATR3kgGwH9tv06KM69SIB7yXs=;
        b=r28aJTggFs35jUXwEH0e470nPU4ZEn0nLim4FREKZllZwBCT+hJj4QnrU1p5TXMuTw
         I29/TsQeUvdYAnYdRaK5ofw7I0DxxQpDSnUkQVPJTsqhDuUAvQI54CbCRedKb40sawhP
         z5DyvRkDsURHoRL7OG3laxxrA18nXdrOGn5lSjRqx7b1N8V6AakZK1p4KWl8N2yetuno
         Uiaj3tvvS14DBelnb+sff11v9S2Ttlnq/09yIhuFGDC7l0qP1rAz2ZiM7JRIi7ltMxoX
         kYU3H1HGyvBidHsxDSBsGjuiAFlWXdnboOY2ndAoT3FvnwDAO/iRmtSf78cJLdOFRFzq
         zhEw==
X-Gm-Message-State: AAQBX9cCQddhq56uAxeo6B8IKlPjQMz6r0W8zHlqAT01gSocPwSH7QD4
        w5mDHxgLU6yUzdk3l555B9Mjkg==
X-Google-Smtp-Source: AKy350bpf17pIYUtctW1UmQYRPMkHHfIjNcaEq9b/wtBb4XXFWdqt7apDJceS74tZ2toNjiTf4y38A==
X-Received: by 2002:adf:fb0d:0:b0:2e5:17a4:7d65 with SMTP id c13-20020adffb0d000000b002e517a47d65mr1582583wrr.39.1680200023887;
        Thu, 30 Mar 2023 11:13:43 -0700 (PDT)
Received: from vdi08.nix.tessares.net (static.219.156.76.144.clients.your-server.de. [144.76.156.219])
        by smtp.gmail.com with ESMTPSA id e18-20020a056000121200b002d24a188b64sm33459741wrx.112.2023.03.30.11.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 11:13:43 -0700 (PDT)
From:   Matthieu Baerts <matthieu.baerts@tessares.net>
Subject: [PATCH v3 0/4] docs & checkpatch: allow Closes tags with links
Date:   Thu, 30 Mar 2023 20:13:22 +0200
Message-Id: <20230314-doc-checkpatch-closes-tag-v3-0-d1bdcf31c71c@tessares.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAELRJWQC/42OS67CMAxFt4IyxlAn/cAbsQ/EwEldEsFLURwqE
 OreSRkyYnh85XPvSwmnwKL+Vi+VeAoSxljArFfKeYpnhtAXVrrSpjJYQz86cJ7d5UbZeXDXUVg
 g0xmwM2ibrmlai6r8WxIGmyg6vxiuId5l+0+SOS3xLfEQHp/q46mwD5LH9PwsmXC5/lI6IVSAd
 meqTvOe9nTILEKJZRM5q0U86Z9lusiGmmrsdi0Obf8lm+f5DeOHyqExAQAA
To:     Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        =?utf-8?q?Kai_Wasserb=C3=A4ch?= <kai@dev.carbon-project.org>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mptcp@lists.linux.dev,
        Matthieu Baerts <matthieu.baerts@tessares.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3054;
 i=matthieu.baerts@tessares.net; h=from:subject:message-id;
 bh=P6AoCjPKkmZgS1nv0s1/YpaDCkuDnCn+pulVbPGi3fU=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBkJdFWd6L1EDibjVLoRL8MVbW7B74nKBeqWTkWV
 jLorHcm6OaJAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCZCXRVgAKCRD2t4JPQmmg
 cwnXD/9PUHGS5kFofgqXyvh4xymo63lE27hUiy16eFTdsOmc5RBXX1wJRyv+p4K3iJOs1kK7t1B
 6iHAQT9+YDDdwjKgMHHUM3P6RG14+PXH3taTgL8FPWeM9CCHbWhmT7t1WF102Z4sFH4FiYfoehc
 PyUKmGHUnkrITvb28LN5r7wdxTqiphQIS72Ed8R+C3AfahWr9poP0GiMTrWMNPKmI70VTT2Wh7N
 PGvQ4io348yw80+QT3KuXkxE/cgG/5SlWYkOev8Q1QpKTcO3tvtG4anudQ+J06YSEQg4DDYXzk8
 tvQaQV8k+2E9f7SqbOu0nXfUIr8RPjfAOpz901UXTs6EIdcqmxqJqS1sHlO0Chrc1YbHOZYK0Al
 HgtoCk31vLqtyv+p983bnY5oTRaDpoU2AAY2BujS3WKs49KcN7HIBSXvkFyOpRF2PP9BzQCc6CC
 zDwWuLB8p/Wk8+8fe6/Dxca0/WejYdwkZAeyH/I90tBvl/qgTyCw2EeOCyG4lB8G9aZiaYxSeum
 R7a3LKBY64/c6YlQiO8a157JTWFsEsmComat6PC59/RzpCoHb70KlH73dGHS2le+KPPISCoVw0d
 xIP2thgk9hRIAuWniP/I2vE8hEGFxtEkZ7+NhVwavemfbe+a8L/70qilEcVBuEFm0fMswWWHRzY
 DkeoZYcleOGd2ZQ==
X-Developer-Key: i=matthieu.baerts@tessares.net; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since v6.3, checkpatch.pl now complains about the use of "Closes:" tags
followed by a link [1]. It also complains if a "Reported-by:" tag is
followed by a "Closes:" one [2].

As detailed in the first patch, this "Closes:" tag is used for a bit of
time, mainly by DRM and MPTCP subsystems. It is used by some bug
trackers to automate the closure of issues when a patch is accepted.
It is even planned to use this tag with bugzilla.kernel.org [3].

The first patch updates the documentation to explain what is this
"Closes:" tag and how/when to use it. The second patch modifies
checkpatch.pl to stop complaining about it.

The DRM maintainers and their mailing list have been added in Cc as they
are probably interested by these two patches as well.

[1] https://lore.kernel.org/all/3b036087d80b8c0e07a46a1dbaaf4ad0d018f8d5.1674217480.git.linux@leemhuis.info/
[2] https://lore.kernel.org/all/bb5dfd55ea2026303ab2296f4a6df3da7dd64006.1674217480.git.linux@leemhuis.info/
[3] https://lore.kernel.org/linux-doc/20230315181205.f3av7h6owqzzw64p@meerkat.local/

Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
---
Note: After having re-read the comments from the v1, it is still unclear
to me if this "Closes:" can be accepted or not. But because it seems
that the future Bugzilla bot for kernel.org and regzbot would like to
use it as well, I'm sending here new versions. I'm sorry if I
misunderstood the comments from v1. Please tell me if I did.

Changes in v3:
- Patch 1/4 now allow using the "Closes" tag with any kind of bug
  reports, as long as the link is public. (Thorsten)
- The former patch 2/2 has been split in two: first to use a list for
  the different "link" tags (Joe). Then to allow the 'Closes' tag.
- A new patch has been added to let checkpatch.pl checking if "Closes"
  and "Links" are used with a URL.
- Link to v2: https://lore.kernel.org/r/20230314-doc-checkpatch-closes-tag-v2-0-f4a417861f6d@tessares.net

Changes in v2:
- The text on patch 1/2 has been reworked thanks to Jon, Bagas and
  Thorsten. See the individual changelog on the patch for more details.
- Private bug trackers and invalid URLs are clearly marked as forbidden
  to avoid being misused. (Linus)
- Rebased on top of Linus' repo.
- Link to v1: https://lore.kernel.org/r/20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net

---
Matthieu Baerts (4):
      docs: process: allow Closes tags with links
      checkpatch: use a list of "link" tags
      checkpatch: allow Closes tags with links
      checkpatch: check for misuse of the link tags

 Documentation/process/5.Posting.rst          | 10 +++++++
 Documentation/process/submitting-patches.rst | 10 +++++++
 scripts/checkpatch.pl                        | 43 ++++++++++++++++++++++------
 3 files changed, 55 insertions(+), 8 deletions(-)
---
base-commit: ffe78bbd512166e0ef1cc4858010b128c510ed7d
change-id: 20230314-doc-checkpatch-closes-tag-1731b57556b1

Best regards,
-- 
Matthieu Baerts <matthieu.baerts@tessares.net>

