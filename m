Return-Path: <linux-doc+bounces-86607-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LDBK/0S/2nJ1wAAu9opvQ
	(envelope-from <linux-doc+bounces-86607-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 12:57:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBC74FF6D9
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 12:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79B5C3005A82
	for <lists+linux-doc@lfdr.de>; Sat,  9 May 2026 10:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580023126A9;
	Sat,  9 May 2026 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="reKQLLA7"
X-Original-To: linux-doc@vger.kernel.org
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC7C13B58A;
	Sat,  9 May 2026 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778324216; cv=none; b=qE+RDvzjdOdYYaJ3BKXXTSd+RaHv3Bo8+t8SoXL6mDRd4csj+e9fiSRiVPXud9aCHevKsMsNRNVeTljS38n97QrpOYlhLqj6zFYmz2uJzQASMMS4gOFlLrtRS6+L/PClAAAf3s3d8yfKlLksvA2SCT3pfis6ym9Nh2w9MHlSefs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778324216; c=relaxed/simple;
	bh=LVFqfT4OVpDIyAWL8zgBfiuWGwcYlnzMje30sFMm5Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2RWbRcQfgW6q07ymf6e4oCEDM5MSR9MpSt1YPepfDKexXgKkebMil8OOnj16XxA82rju+QrW3DZyg1MEPFQ+J/W1iuThnME00DQEJDteVlIE/BsrG6j0gQyy9LB/YbJxxTBzjYfzAFbEyYMwqAbkPcmf5SpCuz2KvmUlvOZsU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=reKQLLA7; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778324210; bh=Tp4qZVban5oEyiwGacx8x8DqU3aIlZX5Tm7Wcinr03A=;
	h=From:Message-ID:From;
	b=reKQLLA7hEijyHD3XeMMgQJmoZ9OVClLZE2cKCjGuwkEUi3Gsh0upfwWOlvGVbTOA
	 G0dEG5g8NenYJ2N2Vz7ihlvDHSJNX/wJKXUVRaOQgR4u9t7LAKvnY8B5JDkCIPFRd7
	 eKqSdphHsQswWL5xWF/Z05sn2MAj9JW5pOAswYdg=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 6D34DC0BA7;
	Sat, 09 May 2026 12:56:50 +0200 (CEST)
Date: Sat, 9 May 2026 12:56:50 +0200
From: Willy Tarreau <w@1wt.eu>
To: Leon Romanovsky <leon@kernel.org>
Cc: greg@kroah.com, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, security@kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Documentation: security-bugs: new updates
 covering triage and AI
Message-ID: <af8S8rF5yz5ghOk1@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509105222.GA15586@unreal>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509105222.GA15586@unreal>
X-Rspamd-Queue-Id: 5CBC74FF6D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[1wt.eu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[1wt.eu:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[1wt.eu:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-86607-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[w@1wt.eu,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 01:52:22PM +0300, Leon Romanovsky wrote:
> On Sat, May 09, 2026 at 11:47:52AM +0200, Willy Tarreau wrote:
> > This series tries to translate recent discussions on the security list
> > on how to better handle reports. It details:
> >   - when not to Cc: the security list
> >   - what classes of bugs do not need to be handled privately
> >   - minimum requirements for AI-assisted reports
> > 
> > As usual, this is probably perfectible but can already help in the short
> > term as we can point it to reporters, so barring any strong disagreement,
> > better continue to proceed in small incremental improvements and observe
> > the effects.
> > 
> > Thanks!
> > Willy
> 
> <...>
> 
> >   - Leon, I kept your reviewed-by since changes are very minimal and
> >     didn't change the initial spirit.
> 
> Thanks. The intent is the same, and I'm not the right person to argue over
> the precise wording anyway.

That was also my understanding, but thanks for confirming!

willy

