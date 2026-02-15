Return-Path: <linux-doc+bounces-76047-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /svuEV0XkmlOqwEAu9opvQ
	(envelope-from <linux-doc+bounces-76047-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 15 Feb 2026 19:58:37 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4F513F75E
	for <lists+linux-doc@lfdr.de>; Sun, 15 Feb 2026 19:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 97E1F300683F
	for <lists+linux-doc@lfdr.de>; Sun, 15 Feb 2026 18:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AD22ED84A;
	Sun, 15 Feb 2026 18:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifpso5kl"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160E61A23A6;
	Sun, 15 Feb 2026 18:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771181912; cv=none; b=j+7ZEiUFS9CVlU1osux/E/dLBBWwwXSA9To5Awv0wJ2BsBk6VLzg6euBfs4YARUMaCUZqawpmuoIQKGsfJfxLKwViiflXK7DubJ2wTEWC0bTk29NEK3fiyiMfU755Ae7HTpGPBL5kHUqtphdLH6uEdI35isF7J5K8oE7k1+27gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771181912; c=relaxed/simple;
	bh=e8+zXyLyQOTjEdWbfxG/cI3yq4pvLSV9XN1tWBz0cKk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=CL6jhDKctgpMh2fJPOgACJRGDpf+/hb8T9Q1faagrgQtPH2MpODmdpembiAx4HL1BborAdQ1PVOzt1YTDdxcwjHz6J7E3+9la02Qb5Q2S6HTpzmgAbgEdkKpcEpNv/jGfSu8Iwi2guRjIo0bz2IcW3XRjugnpRQOnSGphJZa8yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifpso5kl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE65AC4CEF7;
	Sun, 15 Feb 2026 18:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771181912;
	bh=e8+zXyLyQOTjEdWbfxG/cI3yq4pvLSV9XN1tWBz0cKk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ifpso5klfDQshGrzyQ4/RyyCdaaDjMXzOGCgu6sla7GIFIkerOIQJAedZznJHYETY
	 TGZeburOFAZiZSbEJ9gulBdH8USsPUsU51NFoL9V1mzSmtFe6hKv8E53FOjnUkm98/
	 vmb9UIJmpoWdKwUw/U8yK/MAAHWUTkswGFh3qilH11TQUYdUg4uBiC3bySqOQQpJzA
	 96mJHMOOvO5uC9MeF7DBWMwUhwayLmSTeDOGN7uoISQ2DtHTxElyKBt7zm5FPQVj2Z
	 wD3X3jZ/uqFMMw3QetRaJbHEOJor197IcYNsfRwdR26Whqgkh6AAqvxz3oMlB3MIxS
	 Eu9c82mjVi+qA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B4133930925;
	Sun, 15 Feb 2026 18:58:26 +0000 (UTC)
Subject: Re: [GIT PULL] Documentation fixes for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <87wm0dq600.fsf@trenco.lwn.net>
References: <87wm0dq600.fsf@trenco.lwn.net>
X-PR-Tracked-List-Id: <linux-doc.vger.kernel.org>
X-PR-Tracked-Message-Id: <87wm0dq600.fsf@trenco.lwn.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.0-2
X-PR-Tracked-Commit-Id: e1e828a1e9a79af76a7cdc271e0a506e496c2eaa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 26a4cfaff82a2dcb810f6bfd5f4842f9b6046c8a
Message-Id: <177118190454.3159544.14003375254801479868.pr-tracker-bot@kernel.org>
Date: Sun, 15 Feb 2026 18:58:24 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-76047-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0D4F513F75E
X-Rspamd-Action: no action

The pull request you sent on Sun, 15 Feb 2026 10:19:27 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.0-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/26a4cfaff82a2dcb810f6bfd5f4842f9b6046c8a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

