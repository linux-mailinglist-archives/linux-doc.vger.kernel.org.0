Return-Path: <linux-doc+bounces-82590-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKhuM84C1GkwpQcAu9opvQ
	(envelope-from <linux-doc+bounces-82590-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Apr 2026 21:00:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2423A6760
	for <lists+linux-doc@lfdr.de>; Mon, 06 Apr 2026 21:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 013B5301CFAE
	for <lists+linux-doc@lfdr.de>; Mon,  6 Apr 2026 19:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049BB396D15;
	Mon,  6 Apr 2026 19:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G123IoML"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D266F396D0E;
	Mon,  6 Apr 2026 19:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775502026; cv=none; b=uPKCuFp8y2n5TLboWthkKDZC51DXx+Bp6qBBAFwyMK3tQL4RVqOMFSiNkDIhBLPZ1Gn9J6yytklGFzVQ8ZUzpsifT5fLITpiKpcGVAMHU8pceLvrbeaJ8wGZJ5R6opYjcbtx8dtWvqoHIDzHXfePAQUY6uCPfxEYqcE6hjaAYoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775502026; c=relaxed/simple;
	bh=xvXQizAYbg9QVBQa12g29cd2+dl0lMrOtgt96kgKkmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ux1GUtDEypK4vCeum6Qoa6RdjB8NQRthSQ/vK331IjSbOg/pOmVLH+G2k2g4qGLLFZg1KJ9Ps17jKqhHGHG4mz22WXL2E7APG+o4DQdV8MOfXlUUr6gA++UeKOWdSeEf13dYkVpwR1K4/tLsJcu/AZ5MW3+z5//Ww0MCLkvjIeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G123IoML; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701E5C4CEF7;
	Mon,  6 Apr 2026 19:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775502026;
	bh=xvXQizAYbg9QVBQa12g29cd2+dl0lMrOtgt96kgKkmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G123IoMLFAbIvOHUfizv6t0rr6NE/TK/Oii6VWr7/RoK6/JdHFVonYQ99f5OcV0Zt
	 zR1xgAPz5sawicuwhRE2REU1d+wyvVlCm4AxmuRRE/oKaDwrCDMrJlKG9t+a6svbeK
	 /ZRwe9CVfLcXtmNoGLZ8sumbg1riJLvJf4PkOnpC2n90usF62Q/vRw1EBygMSxeaPQ
	 PEM7nC3ZPoQwBdMZyz5OJlXO8cwnxuUBGdL465OsUA45qXAf7cgUzxexXBfq6UJRnb
	 B+PiX1vzVoh58Khw767MYXzpQ4oIonxSxr2sblO/vU7kjsErn0YCe2g8KNDLYEUw11
	 z3RVBlEClr77A==
Date: Mon, 6 Apr 2026 15:00:25 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, joe@perches.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, apw@canonical.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] checkpatch: add --json output mode
Message-ID: <20260406-true-whippet-of-luck-d3c2ba@lemur>
References: <20260406170039.4034716-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406170039.4034716-1-sashal@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-82590-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perches.com,lwn.net,linuxfoundation.org,canonical.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mricon@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 1E2423A6760
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 01:00:39PM -0400, Sasha Levin wrote:
> Add a --json flag to checkpatch.pl that emits structured JSON output,
> making results machine-parseable for CI systems, IDE integrations, and
> AI-assisted code review tools.
> 
> The JSON output includes per-file totals (errors, warnings, checks,
> lines) and an array of individual issues with structured fields for
> level, type, message, file path, and line number.
> 
> The --json flag is mutually exclusive with --terse and --emacs.
> Normal text output behavior is completely unchanged when --json is
> not specified.

I see that it's writing json out manually, implementing its own escaping.
While there are upsides to not requiring a perl json library, I think it's
fair to expect that people who would want to get json output can probably make
sure that JSON::XS is installed.

Not a strong object, but seems cleaner that way.

-K

