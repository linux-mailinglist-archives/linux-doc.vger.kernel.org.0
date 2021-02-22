Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE94321FF6
	for <lists+linux-doc@lfdr.de>; Mon, 22 Feb 2021 20:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233052AbhBVTUD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 22 Feb 2021 14:20:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:50580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233019AbhBVTQa (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 22 Feb 2021 14:16:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 68DAE64E34;
        Mon, 22 Feb 2021 19:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614021122;
        bh=G24lkVZVKnzhjatbfa5GOgRODOmt2kodcbWzPOCC0YA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=qKw3LVIaR4O2J4PSYEoJM9Q+WZDeb0hOTBT+39V+rm3IUugGD0Is9esR/63o97Bz2
         lWtRghuleZiubpPpg0zuC42rVlGgLFlsIIA4KMxfykid7aGlv9wtCVWFg8Vxu+7TzA
         /dtW9k9tXeWNEI304w3osTlisoAV4XcIIw0jEahdxHcTzkGsOv/SCgD+QWI5Afib1J
         iZqJOK6gF5tVldns5+3VxCVAQjdZQp5IUh8thJTJGDx5WkGH4mBsNZUo4kMGDQFP4f
         EQJFc/uqCKDsk9icmckV/uYF72TRKo3jHpmOI/SCSauSPPj3Xcd7Jj/2rmXpQdD93c
         hTrAxBQX+vuQw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 64316609CC;
        Mon, 22 Feb 2021 19:12:02 +0000 (UTC)
Subject: Re: [GIT PULL] Documentation for 5.12
From:   pr-tracker-bot@kernel.org
In-Reply-To: <87lfbpjb8t.fsf@meer.lwn.net>
References: <87lfbpjb8t.fsf@meer.lwn.net>
X-PR-Tracked-List-Id: <linux-doc.vger.kernel.org>
X-PR-Tracked-Message-Id: <87lfbpjb8t.fsf@meer.lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-5.12
X-PR-Tracked-Commit-Id: 3c2e0a489da6a7c48ad67a246c7a287fcb4a4607
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0e63a5c6ba9679a903f95b10827f74fe183017fa
Message-Id: <161402112240.16114.12683254551153024412.pr-tracker-bot@kernel.org>
Date:   Mon, 22 Feb 2021 19:12:02 +0000
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.org, linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Mon, 15 Feb 2021 14:02:10 -0700:

> git://git.lwn.net/linux.git tags/docs-5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0e63a5c6ba9679a903f95b10827f74fe183017fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
