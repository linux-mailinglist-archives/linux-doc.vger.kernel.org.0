Return-Path: <linux-doc+bounces-83389-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JH8MZRv3mleEQAAu9opvQ
	(envelope-from <linux-doc+bounces-83389-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2026 18:47:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A2B3FCB4C
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2026 18:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED046304EBB4
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2026 16:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F56273D8F;
	Tue, 14 Apr 2026 16:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rsIxFhd/"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7329E1EB5E3;
	Tue, 14 Apr 2026 16:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776185233; cv=none; b=U8rI1XtKjD8EOp5si2/iMU+iCJBxMraRFUtijlIgzCVHYpoC84F7dKyyxjYfsEC8YlbhmSZKSqJb7BS9xuayrBQma6yxoYUnr8HoR5sCsZl1+MRdjNC1oYZ4oXVfGW70e4t+qwwRta3OUOq4tjtC/G7VYpnhgusqbeRDvfHTNCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776185233; c=relaxed/simple;
	bh=0tc0IUJWz2LuJ9AKD2G6Ttu98/WE9sdiWjDB9UpNF5o=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ah27akwKqnbc7Iufq7nzE1v8zhzsPlAE4OtTUygggX89eNysLOupiyyEnO4mdgxdn5LdWODprnAiJ6hIrdASqzmhZxjMNnHzRTbMNC/ju4n7RL/WO1M6PA16UvLOkvPPoEj0Fa1n0vqCyoS4w/57kpsMDaUnU5EEUti6jpM+Wps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rsIxFhd/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9AEC19425;
	Tue, 14 Apr 2026 16:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776185233;
	bh=0tc0IUJWz2LuJ9AKD2G6Ttu98/WE9sdiWjDB9UpNF5o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rsIxFhd/vIXFY9vIo/UanUCjRcEaUYRGbfzWjsQyKvwiKDPpbf6da/r6NkoVX/BtF
	 snloyaAMFT2V1zN64UIPcjqmUgn8uPsLVeU4Szt6ZdEVlwQfwiRqFuMPANPYexMlPx
	 NtXI8TEkADEPXDmzw4aUbXaByP9oO/uaHw+HMHJ9yuR/DV0H/KhUvt426SvVqifdQF
	 nNbd1KurNbWO57LBi4Uwl3ZmsbiuRGtHlOiPhctKdOLzcXbKtJbEtISw/X6Abaj+nq
	 sz4xm7gjEico/ncDebI9yOhfP/XiLJ/MgdETr4Iit4+tNAbHovlI7s+Wh3XkGUXh8F
	 rL78LMbUIOKog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E123809A07;
	Tue, 14 Apr 2026 16:46:44 +0000 (UTC)
Subject: Re: [GIT PULL] Documentation for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <87bjfnzw2x.fsf@trenco.lwn.net>
References: <87bjfnzw2x.fsf@trenco.lwn.net>
X-PR-Tracked-List-Id: <linux-doc.vger.kernel.org>
X-PR-Tracked-Message-Id: <87bjfnzw2x.fsf@trenco.lwn.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.1
X-PR-Tracked-Commit-Id: 40a3f6c5e2604ff7c007da6628120529569e950c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5181afcdf99527dd92a88f80fc4d0d8013e1b510
Message-Id: <177618520329.1376142.14987411467425321585.pr-tracker-bot@kernel.org>
Date: Tue, 14 Apr 2026 16:46:43 +0000
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Shuah Khan <shuah@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83389-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 38A2B3FCB4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Sun, 12 Apr 2026 15:51:18 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5181afcdf99527dd92a88f80fc4d0d8013e1b510

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

