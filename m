Return-Path: <linux-doc+bounces-76886-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJgRLobwnWkWSwQAu9opvQ
	(envelope-from <linux-doc+bounces-76886-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 19:40:06 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A10718B83B
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 19:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FEC93016288
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 18:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FD43A9DAB;
	Tue, 24 Feb 2026 18:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmqx0zGr"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531A933AD9C;
	Tue, 24 Feb 2026 18:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771958403; cv=none; b=c23LS+nG74impcmImDGhMxjlyLBnyUAdeBCyp/pDLltlunBD529QVz/XfQT3Qjc6ttF64baMLCNIZ3s6NchG7kfSMPXjEnN1Mk26ADlwbg4eHROOnHylCWaM2TBBCBFrs60gfpLhzYsQS3DOK0x90OtmEgKM5eQDJW8BkISMKGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771958403; c=relaxed/simple;
	bh=tStRS8KB0V20XKC/Dt5aKDP2xZNQUVl+3ZrOp5PQtHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZs5T81sxrY1H4CYLsmBSsxgMZuWYdAX96gkKG7K+UhUZt61M5ZfdHeTTB3pe8H0w2fF5lzxoY7LiWzDR08D1XeagEHk0n4EgFHVqCMoXG/9X5CoCwFD87OSD11mcnUHHRqW70rcLxN8t6Py7gf/PulZ7DKUpFtUXoczmdvCSOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmqx0zGr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4EDCC116D0;
	Tue, 24 Feb 2026 18:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771958403;
	bh=tStRS8KB0V20XKC/Dt5aKDP2xZNQUVl+3ZrOp5PQtHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cmqx0zGr74C5Orv+tBKHEOJnNCcMzUOcwJk62EF7Gv3wAaxRZ1tVYvte98CmsMo3U
	 jE5BaUauiBXq4Lw+eTxk5ckjqUd32vM8t9BJezzSHUwbWTH2Mn/Gw7oBIZSFrECXXr
	 ue+QatGGT1cLmrypddQMMJFPiny0DQnUhsqsi7AmQnizHB2ObjUv1NbUr4hhzmPGHy
	 wIDsuObAiAEZVTYQqouF9r+RWuuA7MwzRmJZWpwNhA4Cqa23fJSZ/1mXK5sKUDDJHZ
	 rtX537DX79S7KWqFwVHBXryYzXJsEefyYJMopm3Ar2hsG/QFujJD8SscTwqyhsmjtA
	 vq2VuykH+/K2Q==
Date: Tue, 24 Feb 2026 12:40:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Markus Heidelberg <m.heidelberg@cab.de>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yanteng Si <si.yanteng@linux.dev>
Subject: Re: [PATCH] docs: dt: unittest: update to current unittest filenames
Message-ID: <177195840111.3253999.18404449119161660687.robh@kernel.org>
References: <20260223111207.54640-1-m.heidelberg@cab.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223111207.54640-1-m.heidelberg@cab.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-76886-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cab.de:email]
X-Rspamd-Queue-Id: 3A10718B83B
X-Rspamd-Action: no action


On Mon, 23 Feb 2026 12:12:03 +0100, Markus Heidelberg wrote:
> There have been several renamings and modified Make rules since
> introduction of this unittest document.
> 
> The file list in the Chinese translation had been extended.
> For a change to drivers/of/unittest-data/tests-*.dtsi surrounding
> translation has to be updated.
> 
> Signed-off-by: Markus Heidelberg <m.heidelberg@cab.de>
> ---
>  Documentation/devicetree/of_unittest.rst      | 20 +++++++++---------
>  .../zh_CN/devicetree/of_unittest.rst          | 21 +++++++++++--------
>  2 files changed, 22 insertions(+), 19 deletions(-)
> 

Applied, thanks!


