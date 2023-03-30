Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 022E96D0D7E
	for <lists+linux-doc@lfdr.de>; Thu, 30 Mar 2023 20:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbjC3SNu (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 30 Mar 2023 14:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjC3SNs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Mar 2023 14:13:48 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A95F4E19C
        for <linux-doc@vger.kernel.org>; Thu, 30 Mar 2023 11:13:46 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id t4so14754601wra.7
        for <linux-doc@vger.kernel.org>; Thu, 30 Mar 2023 11:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google; t=1680200025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ItInTAdnUAKLm+cm48IAJm3RPistuWUxFPvzsYYlPp8=;
        b=oAoL62t7ERceub5TArLZ0xHe2p0ee4pBYyiAIEOnsb8ui0gahY61b5IZaCieOHj209
         Jt8BFb2IIz5n1Q9I1ivzz0o/vULmPNWs9hXFwX0fWsAu+lwjuWxgTwapVPvI3bffYMfW
         pQ+eneHIxILNbXo7+sRI6WPXcIcsczDyxv7sw9P7+yaD/vlDFrKxfynWWPjPX3ZOW6EQ
         VQWD1m1VrZ4xTS8GOhlWtJ4TwCYuHe4Gnza6xlRoPu+qmx8nSN81FRD+y1eOjU8b0SE+
         c6xsUUWt7QfGDTBIz43ahfu8ssU0xaERzizLu4h5pnclgf5mThDiU5nIlTkMaCx4T6pp
         UBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680200025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItInTAdnUAKLm+cm48IAJm3RPistuWUxFPvzsYYlPp8=;
        b=OBlJL/Ss08o4TGNgZG671M+eaCwgWPH/FUtSPfjUzQ0qcrVpzqM1pQW3aRJcwey9NR
         xNCcwghX983C31kGPSLn1BEER51UII9oARUAnwClxIZ2WrU46y7pFzFkHuyRdirXSDF2
         Xoq4/c1sLtU0wACnCuhSeWojxiIaqxC+3Z9kXy7mGA8Cd32/ADFWvlfOGQ/apmPBsuBk
         jCVnPcieI+CqfqV5+raZZnLE2iCkuGxA4wQm2h2I7igQFYU0Wq25JwXBQePIwJZpIQGZ
         DymrSwBfHYlrAYh60fKT3bioWGjGCV4PTJwIs8a1o21MJcVWrpzHkF7hYKWAYoyBoFhz
         M/cw==
X-Gm-Message-State: AAQBX9fwzQ9HxPGeZ7k2vreRSCQypOnAdeVTdnuGliaqq22d7cEzeqbC
        cGsPCndsoOszbmzJrpjBwY+r/g==
X-Google-Smtp-Source: AKy350ZlArt1OzD3XguKd9+sKnR9BT4NPMnz/d7pVymlBzEEdHPMWH0ks7bIiqryGmqigP4mzlI03Q==
X-Received: by 2002:a5d:68cb:0:b0:2cf:fd6:b83f with SMTP id p11-20020a5d68cb000000b002cf0fd6b83fmr4895020wrw.8.1680200024971;
        Thu, 30 Mar 2023 11:13:44 -0700 (PDT)
Received: from vdi08.nix.tessares.net (static.219.156.76.144.clients.your-server.de. [144.76.156.219])
        by smtp.gmail.com with ESMTPSA id e18-20020a056000121200b002d24a188b64sm33459741wrx.112.2023.03.30.11.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 11:13:44 -0700 (PDT)
From:   Matthieu Baerts <matthieu.baerts@tessares.net>
Date:   Thu, 30 Mar 2023 20:13:23 +0200
Subject: [PATCH v3 1/4] docs: process: allow Closes tags with links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230314-doc-checkpatch-closes-tag-v3-1-d1bdcf31c71c@tessares.net>
References: <20230314-doc-checkpatch-closes-tag-v3-0-d1bdcf31c71c@tessares.net>
In-Reply-To: <20230314-doc-checkpatch-closes-tag-v3-0-d1bdcf31c71c@tessares.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6878;
 i=matthieu.baerts@tessares.net; h=from:subject:message-id;
 bh=tCxJpCXZj/WPjBCToCpp+PIvuovD/Z8f6431psypKfg=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBkJdFWi0sLZAteAQ7quTCDXY0wVDMKo9SHHZpFH
 reIJgAmbMqJAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCZCXRVgAKCRD2t4JPQmmg
 c7nlD/wI1UTBtopo8m/HSsTHXh/OShmdMF9UeXrWgwgn1Ch24A6x6JUw5L7qcDEJDH9fiZk4z3g
 CExEzis51ESVDfUaBoIF1F+UN/WjG6Ol8Ntx7Q0w+yTwclRLgR5CKF93jZvS064JKUfMo6kyZkw
 cXJW4kkM0net/5DicixSKupjHETn6eicuPFMe6/dww51hX+98+9KKZSHs7K0miiLZ7ZvZC+a5FS
 XfNXGPPvKmd0PIABR7+nLZ2lonL7EHnIseTdU2rN5PR5XpdXLABGsRtPZ/mSuipaQs5TxuJLLAb
 kbZ4bTkhIZoab5AWF6Vl6R5eLB2qhr61RqO5UmAqg2ck1Jk/fU5GzJM8morO/zlBTSVMQJP+iP/
 r6e4Ii9QggrM/rSUnhmEbgSJFMRJJJDQJKGzB6PL1yrG9HZkobh+vivcBtH9CedfLwkGV4o+doo
 zOxGIPWNIZ3p6HHiw4dh7fQnWwkfTST7aEGMO1d3vkADk9rouoaUw6x9KnTX79H/Yeq67Q24fK2
 N1nJjnL0a2R7hFnAqSepLv1F888I4t8YbiboUUZ54X5YGZvdgMBpRnxYg2bzvdXRD7I3XE7vMht
 OdFJkLe+Pt6f2+0dSv8fw+Ykz4zQH7ZP6s+9QVOs6K4oHMpaXiSnmI/+Rk27rC5ipHdWY52bDs2
 wgxUqnuCJN1hJFg==
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

Making sure a bug tracker is up to date is not an easy task. For
example, a first version of a patch fixing a tracked issue can be sent a
long time after having created the issue. But also, it can take some
time to have this patch accepted upstream in its final form. When it is
done, someone -- probably not the person who accepted the patch -- has
to remember about closing the corresponding issue.

This task of closing and tracking the patch can be done automatically by
bug trackers like GitLab [1], GitHub [2] and hopefully soon [3]
bugzilla.kernel.org when the appropriated tag is used. The two first
ones accept multiple tags but it is probably better to pick one.

According to commit 76f381bb77a0 ("checkpatch: warn when unknown tags are used for links"),
the "Closes" tag seems to have been used in the past by a few people and
it is supported by popular bug trackers. Here is how it has been used in
the past:

 $ git log --no-merges --format=email -P --grep='^Closes: http' | \
       grep '^Closes: http' | cut -d/ -f3-5 | sort | uniq -c | sort -rn
    391 gitlab.freedesktop.org/drm/intel
     79 github.com/multipath-tcp/mptcp_net-next
      8 gitlab.freedesktop.org/drm/msm
      3 gitlab.freedesktop.org/drm/amd
      2 gitlab.freedesktop.org/mesa/mesa
      1 patchwork.freedesktop.org/series/73320
      1 gitlab.freedesktop.org/lima/linux
      1 gitlab.freedesktop.org/drm/nouveau
      1 github.com/ClangBuiltLinux/linux
      1 bugzilla.netfilter.org/show_bug.cgi?id=1579
      1 bugzilla.netfilter.org/show_bug.cgi?id=1543
      1 bugzilla.netfilter.org/show_bug.cgi?id=1436
      1 bugzilla.netfilter.org/show_bug.cgi?id=1427
      1 bugs.debian.org/625804

Likely here, the "Closes" tag was only properly used with GitLab and
GitHub. We can also see that it has been used quite a few times (and
still used recently) and this is then not a "random tag that makes no
sense" like it was the case with "BugLink" recently [4]. It has also
been misused but that was a long time ago, when it was common to use
many different random tags.

checkpatch.pl script should then stop complaining about this "Closes"
tag. As suggested by Thorsten [5], if this tag is accepted, it should
first be described in the documentation. This is what is done here in
this patch.

To avoid confusion, the "Closes" can be used with any public links. No
need to check if the underlying bug tracker supports automations.
Having this tag with any kind of public bug reports allows bots like
regzbot to clearly identify patches fixing a specific bug and avoid
false-positives, e.g. patches mentioning it is related to an issue but
not fixing it.

Note that thanks to this "Closes" tag, the mentioned bug trackers can
also locate where a patch has been applied in different branches and
repositories. If only the "Link" tag is used, the tracking can also be
done but the ticket will not be closed and a manual operation will be
needed. Also, these bug trackers have some safeguards: the closure is
only done if a commit having the "Closes:" tag is applied in a specific
branch. It will then not be closed if a random commit having the same
tag is published elsewhere. Also in case of closure, a notification is
sent to the owners.

Link: https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#default-closing-pattern [1]
Link: https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/using-keywords-in-issues-and-pull-requests [2]
Link: https://lore.kernel.org/linux-doc/20230315181205.f3av7h6owqzzw64p@meerkat.local/ [3]
Link: https://lore.kernel.org/all/CAHk-=wgs38ZrfPvy=nOwVkVzjpM3VFU1zobP37Fwd_h9iAD5JQ@mail.gmail.com/ [4]
Link: https://lore.kernel.org/all/688cd6cb-90ab-6834-a6f5-97080e39ca8e@leemhuis.info/ [5]
Link: https://github.com/multipath-tcp/mptcp_net-next/issues/373
Suggested-by: Thorsten Leemhuis <linux@leemhuis.info>
Acked-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
---
v3:
- Allow using the "Closes" tag with any bug reports, not only the ones
  supporting automations, useful for regzbot, etc. (Thorsten Leemhuis)

v2:
- Add Konstantin's Acked-by: even if the patch has changed a bit, the
  concept is still the same, I hope that's OK.
- Mention "public" in "5.Posting.rst" file as well. (Jonathan Corbet)
- Re-phrase the new text from "5.Posting.rst". (Bagas Sanjaya &
  Thorsten Leemhuis)
- Clearly mention that private bug trackers and invalid URLs are
  forbidden (Linus Torvalds).
---
 Documentation/process/5.Posting.rst          | 10 ++++++++++
 Documentation/process/submitting-patches.rst | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
index 7a670a075ab6..c755ca795f15 100644
--- a/Documentation/process/5.Posting.rst
+++ b/Documentation/process/5.Posting.rst
@@ -217,6 +217,16 @@ latest public review posting of the patch; often this is automatically done
 by tools like b4 or a git hook like the one described in
 'Documentation/maintainer/configure-git.rst'.
 
+Similarly, there is also the "Closes:" tag that can be used to mark any
+kind of public bug report as closed. For example::
+
+	Closes: https://example.com/issues/1234
+
+Some bug trackers have the ability to close issues automatically when a
+commit with such a tag is applied. Some bots monitoring mailing lists can
+also track such tags and take certain actions. Private bug trackers and
+invalid URLs are forbidden.
+
 A third kind of tag is used to document who was involved in the development of
 the patch. Each of these uses this format::
 
diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 69ce64e03c70..b0ea03f18bad 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -134,6 +134,16 @@ resources. In addition to giving a URL to a mailing list archive or bug,
 summarize the relevant points of the discussion that led to the
 patch as submitted.
 
+It might be interesting to use the 'Closes:' tag to mark any kind of public
+bug report as closed. For example::
+
+	Closes: https://example.com/issues/1234
+
+Some bug trackers have the ability to close issues automatically when a
+commit with such a tag is applied. Some bots monitoring mailing lists can
+also track such tags and take certain actions. Private bug trackers and
+invalid URLs are forbidden.
+
 If your patch fixes a bug in a specific commit, e.g. you found an issue using
 ``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
 the SHA-1 ID, and the one line summary.  Do not split the tag across multiple

-- 
2.39.2

