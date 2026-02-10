Return-Path: <linux-doc+bounces-75737-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ2tLhK+immmNQAAu9opvQ
	(envelope-from <linux-doc+bounces-75737-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 10 Feb 2026 06:11:46 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 663CB116FE3
	for <lists+linux-doc@lfdr.de>; Tue, 10 Feb 2026 06:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC71D307098A
	for <lists+linux-doc@lfdr.de>; Tue, 10 Feb 2026 05:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8015732E138;
	Tue, 10 Feb 2026 05:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EyC9RoFA"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D73632E136;
	Tue, 10 Feb 2026 05:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770700129; cv=none; b=WKhIDMMRFQLjrzn24NZsMDXV9rOX3MKdsmFTUGbl9ZT+dYuhRGxty0o0XTvrj+sj2IatQwT7Z1yA7Ei2yynfcEJK+1KLnmemyhfI7QSzusPBPk2bxqb1rVdUhtng4mcp/pet279NNY5zT1KORaxeeU9DQToqrc3qLfKWJPpraqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770700129; c=relaxed/simple;
	bh=1l15YIh8KuGIekdEEB28i/ht9rPX+5xW0YdoIsYhMH4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Iw4W6NErU9VIt28Cnu5rLSG5LtKtJEpGyDtqaeb49Ls80MvwrWgE9tmFtJbo3epZ657X36CmmBVGn6Hk1GAW4gbSMifIa2nMpJT5+DmkCQW44YuuMPqpLYZFSVn/4MDbaZ5mHPl6AIhg2E3HNbu2HE5mNIGaDWa3AllXpVhbzPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EyC9RoFA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427ACC116C6;
	Tue, 10 Feb 2026 05:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770700129;
	bh=1l15YIh8KuGIekdEEB28i/ht9rPX+5xW0YdoIsYhMH4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=EyC9RoFAN233KRmYRofwGd8N/plfdQUCJH2lrAXAo7w1gE0Ldlf/GLLbWQSXEhZVo
	 NCorlZKjxkWg9KjRx/Sb7qPVQyA29BtX/jajPjJGe6iJpBa/BEDeMzvfDFxGRLG3Nf
	 Jc4QjVhUiqdMJguH/JEehwt+YmBV7rvpxNCoAO+zgjG/TRZmr/iDbB4CHMeqSDuQlf
	 k6UwPWNbSc1zKvj+XhZa+6ZeulZLlARXpWjCaiyQ+jWnFrjjEfCpRNbLfXDr0SEqkX
	 95krgOZDzBxqu2h2qU6yuvC3FVF5NIhQbrxRteRjJQfU6KzZ42I7MtOCW2Ldi/YpfF
	 eEqQGdaeDDKFg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B092380AA5E;
	Tue, 10 Feb 2026 05:08:46 +0000 (UTC)
Subject: Re: [GIT PULL] Documentation for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ikc590gt.fsf@trenco.lwn.net>
References: <87ikc590gt.fsf@trenco.lwn.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87ikc590gt.fsf@trenco.lwn.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.0
X-PR-Tracked-Commit-Id: 0a83293322fde69f1fb4722bd3c79c2d52eef436
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 72c395024dac5e215136cbff793455f065603b06
Message-Id: <177070012455.3352335.6947294105907095832.pr-tracker-bot@kernel.org>
Date: Tue, 10 Feb 2026 05:08:44 +0000
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-75737-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 663CB116FE3
X-Rspamd-Action: no action

The pull request you sent on Mon, 09 Feb 2026 12:32:50 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/72c395024dac5e215136cbff793455f065603b06

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

