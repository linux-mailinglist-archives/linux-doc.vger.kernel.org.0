Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 235D11F5DCF
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2020 23:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbgFJVpc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 10 Jun 2020 17:45:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:35388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726643AbgFJVp2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 10 Jun 2020 17:45:28 -0400
Subject: Re: [GIT PULL] A bit more documentation for 5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591825528;
        bh=qsKGKZulFXJa9+gOtuJbuDo4rfKqTGAeSIRe1N6o9jA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=1VliYvWZObRng7Ex7C4Kjzd6ok8SU9pDRhXT9mpaVrWhczcdnJ9DjGc3cQ0dkKVOF
         RV5iE+KYAN8/6TL7NqcbNYxmwnJ3iiOQ+3wEoS/2ekKm+rJi9efhHa+HOEUtVzIlHU
         cvy60HW5nuWF7EFOIHc6m3vs3LAkji/vVyqb1J9g=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200610145116.42bdc646@lwn.net>
References: <20200610145116.42bdc646@lwn.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200610145116.42bdc646@lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-5.8-2
X-PR-Tracked-Commit-Id: 146f5cdeda153a1c7866cd240d2f464543d368c0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6d62c5b21155acaaaeb24862d62cf15d1dc2d8ba
Message-Id: <159182552798.4867.10208717259713647913.pr-tracker-bot@kernel.org>
Date:   Wed, 10 Jun 2020 21:45:27 +0000
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Wed, 10 Jun 2020 14:51:16 -0600:

> git://git.lwn.net/linux.git tags/docs-5.8-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6d62c5b21155acaaaeb24862d62cf15d1dc2d8ba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
