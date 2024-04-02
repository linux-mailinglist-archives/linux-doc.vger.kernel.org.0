Return-Path: <linux-doc+bounces-13296-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 217D2895D3E
	for <lists+linux-doc@lfdr.de>; Tue,  2 Apr 2024 22:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 769DCB26832
	for <lists+linux-doc@lfdr.de>; Tue,  2 Apr 2024 20:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4174215CD78;
	Tue,  2 Apr 2024 20:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sU5nW9rG"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A81C15B0E8;
	Tue,  2 Apr 2024 20:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712088364; cv=none; b=QHLhnJNC9Fyss+rA1qd1f5WKHMJSxhMoaU6c//L22p94exulW/RYTXvvJJqR/0MHRlw/KE4XH1DBqWNab58751mDHCk/HInSjxoFmohqNSWIhNgUTQjM0ouIPs+HGsI3mc+HNuBNUdUev/i1D/TMY26+BbLwCZmpd7f3kMSfeeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712088364; c=relaxed/simple;
	bh=j2SOHpO5KZKf9U41e3IU8G3vXA+MSgv08QrrZUQ4538=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=X4gWnuu7jTtAI2j1CLBMTw7QHjGGKLAdLrl5/VwyCMcEJt6pw9JSOYjy0g3zvW8XTp2Wvy+8yhN+8B8zazbcnHwfIEuNfr5mOhrftGRe1NG1uP8DlnygN6q7jkjd82kK5ZkBx7MTWkOfWYc9zOtlG+y+vBhs8vU20kGP0mKitg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sU5nW9rG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB8A1C433C7;
	Tue,  2 Apr 2024 20:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712088364;
	bh=j2SOHpO5KZKf9U41e3IU8G3vXA+MSgv08QrrZUQ4538=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=sU5nW9rGR5iUbv7BiBMAERtD8cpL6ScJkPjAQFNDkg0y1JA5FO3Q5i9rlLXTKRjnS
	 0YU9Y11FMk/bEsJijtlSNOD4qMs/M8mDQNb98UUu6V3nc9X9ZsC4L7freFMbzvGWvm
	 EvZAtyGXwC1N6qp9kRikuZsvaLw0yw4AOGZXFK2JfHRzW/4WCTF7zVzgY7zUxbblDE
	 oDhpeJ8GZKWRSaEtt5FGml3L5cswX7rWYrnU6n7t1OfjhOqd3WMlpdigIpzKRjWGom
	 /kI/vtpQwOYz3kNMas7s4F8QyxQ9i9P+H4ZO3qSaz/dINpev6tkKUGeWica5lRCSkj
	 SZ+y7cgWtCtXA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E1092D9A14F;
	Tue,  2 Apr 2024 20:06:03 +0000 (UTC)
Subject: Re: [GIT PULL] Documentation fixes for 6.9
From: pr-tracker-bot@kernel.org
In-Reply-To: <87bk6ryf4t.fsf@meer.lwn.net>
References: <87bk6ryf4t.fsf@meer.lwn.net>
X-PR-Tracked-List-Id: <linux-doc.vger.kernel.org>
X-PR-Tracked-Message-Id: <87bk6ryf4t.fsf@meer.lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-6.9-fixes
X-PR-Tracked-Commit-Id: e9c44c1beaba623b12201d2028bc20f535464d9b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b1e6ec0a0fd0252af046e542f91234cd6c30b2cb
Message-Id: <171208836391.25987.7093038918642754169.pr-tracker-bot@kernel.org>
Date: Tue, 02 Apr 2024 20:06:03 +0000
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 02 Apr 2024 09:10:26 -0600:

> git://git.lwn.net/linux.git tags/docs-6.9-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b1e6ec0a0fd0252af046e542f91234cd6c30b2cb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

