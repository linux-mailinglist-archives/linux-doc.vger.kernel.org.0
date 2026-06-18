Return-Path: <linux-doc+bounces-92800-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gZ+kLpY1NGo5RgYAu9opvQ
	(envelope-from <linux-doc+bounces-92800-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 20:14:46 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 130D06A212A
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 20:14:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92800-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-92800-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F43E3012C65
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 18:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F1535C19F;
	Thu, 18 Jun 2026 18:14:41 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bregans-1.gladserv.net (bregans-1.gladserv.net [185.128.211.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977F4348886;
	Thu, 18 Jun 2026 18:14:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781806481; cv=none; b=GNDO/vloRILtUweuOPHDRoCXo2adoH3F0YZ8yjfAwEheERCPggi9E6NeEQR7Rmba/6N43hIHDv0SzhymU0ftCvxDbBn/Vctvh3Levyr5jJLjaSNrGQ5+h+323UgBJqRsqY4jzag6fgnACMG6ApeDlzdxKcR4Wye0dP1aZOif07k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781806481; c=relaxed/simple;
	bh=WOWmaqp8aGhysVoZr+yEoHr5kwf+QFGaMU1rB6CZO3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXpN5FgoCugNF9rCtiQ+B/T59agFsjnarurpMTakCbR/wLMyMkVIDZncH8m9cIdP3ffs/2jj3bqu6OCaGqKijKrVovYknS3rYKbaT8RcQ/UsfSL+wBR2CrW7lfK08PA0QSrgo+kWFJM/b+DnCKbPXjn0ilkXB0rV5+U46HK1VlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=librecast.net; spf=pass smtp.mailfrom=librecast.net; arc=none smtp.client-ip=185.128.211.58
Date: Thu, 18 Jun 2026 20:14:32 +0200
From: Brett Sheffield <bacs@librecast.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Rafael Passos <rafael@rcpassos.me>, shuah@kernel.org, corbet@lwn.net,
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest docs: remove reference to obsolete/archived
 wiki
Message-ID: <ajQ1iGNw2lf_ZHqp@karahi.librecast.net>
References: <ajOvQKne74gN-7Y2@karahi.librecast.net>
 <1306d609-3375-4f52-8239-b4c2fffb7bec@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1306d609-3375-4f52-8239-b4c2fffb7bec@linuxfoundation.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[librecast.net];
	TAGGED_FROM(0.00)[bounces-92800-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:skhan@linuxfoundation.org,m:rafael@rcpassos.me,m:shuah@kernel.org,m:corbet@lwn.net,m:linux-kselftest@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bacs@librecast.net,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bacs@librecast.net,linux-doc@vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,karahi.librecast.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 130D06A212A

On 2026-06-18 11:02, Shuah Khan wrote:
> My apologies  for not taking your patch earlier. Considering the effort
> you put in with a re-sending the patch and following up here, it is
> only fair for me to take yours instead. Hope it will apply cleanly on
> top of kselftest-next
> 
> Rafael, I am going to take Brett;s patch instead of yours.
> 
> Apologies to both of you for the mix up.

Thanks Shuah & no worries.


-- 
Brett Sheffield (he/him)

