Return-Path: <linux-doc+bounces-93830-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GLCMJeESQGpIbgkAu9opvQ
	(envelope-from <linux-doc+bounces-93830-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 20:13:53 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB136D2770
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 20:13:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=T8GBFPn+;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93830-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-93830-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8A5823008C1E
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 18:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD39329C60;
	Sat, 27 Jun 2026 18:13:51 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F2370836;
	Sat, 27 Jun 2026 18:13:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782584031; cv=none; b=mqLAAxecs1e7KuL1SlsrUBz/zq5mmI0qIbK6amaKcgwQOAldfaufGWnUkw46CU1OLB6bXbma/PDlENT7w98QLcjKdnQ2AOEEbXWKQ6jZGsU9/HDnQc7ShEKyhwcsZT7ko30kBEhK60+LF8asGwhQbs0/gkQ+hX0MXZQLOK8BLfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782584031; c=relaxed/simple;
	bh=BiOcJVMB8N4Ak/yIBnDktAnqfnxpKMjWuWvDSHNolsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=g+L13eog2474Nyi1gDtKkQ+w3NhLm6WLpydvex2cm6+wvbTwdTXMV8A5pUIhKHyRybiijSZPDUwivvsXdJb+LFK/LfYFzaMSpKhtJ8Hq+9gDFS2qya18ss3vBd8FmKhmI+b6aVy8m1hrc5Jp/v0A75qGUmvlX99QhWEKfs2bn5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=T8GBFPn+; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=uHOeYxkKAiQhzavro8PL41M7M0u24klFsT/bDBnVfU8=; b=T8GBFPn+xk3ZFm2LU/zXpKevG3
	eEJQ9w0jSqK6H3a8ohov9xiZk50epFupk2cJWVsN+J4nQCFtxUzpXflnJRVGivTuKv03ERZxSsGT+
	ridnhD3ip5WtuZjhwDhYEgFM14Pvvlw+pRry8xnTYdVJ6AySK3cpSHrUrldHNywmuwJhFIO8muWCF
	l1qd/labDeRwbjp0qegq4WcxwFAczETE6iVfPW8NOp9OK0vuhhVISFaDxi+0LiXsndLVD2pV3Zwo5
	jMBe3qtNXt74sVCjwlOQk8rzEjKdcFDcnI5WExP6SsQSX3YKHBIpV7lEebrY8PqA12MvbEH0ugr5Q
	lbjZc33w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdXXI-0000000ChLV-23bK;
	Sat, 27 Jun 2026 18:13:48 +0000
Message-ID: <1d27f8eb-30eb-4f2a-ad3d-54d39e63ad57@infradead.org>
Date: Sat, 27 Jun 2026 11:13:47 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: parport-lowlevel: Fix curly bracket
To: Manuel Ebner <manuelebner@mailbox.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Andreas Faerber <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "moderated list:ARM/ACTIONS SEMI ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/ACTIONS SEMI ARCHITECTURE"
 <linux-actions@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20260627092359.30044-3-manuelebner@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260627092359.30044-3-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93830-lists,linux-doc=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[mailbox.org,gmail.com,lwn.net,linuxfoundation.org,suse.de,kernel.org,vger.kernel.org,lists.infradead.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:sudipm.mukherjee@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:afaerber@suse.de,m:mani@kernel.org,m:linux-doc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-actions@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:sudipmmukherjee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-doc];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,mailbox.org:email,infradead.org:dkim,infradead.org:email,infradead.org:mid,infradead.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1DB136D2770



On 6/27/26 2:24 AM, Manuel Ebner wrote:
> Remove needless '}'
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/driver-api/parport-lowlevel.rst | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/parport-lowlevel.rst b/Documentation/driver-api/parport-lowlevel.rst
> index a907e279f509..af73741289c9 100644
> --- a/Documentation/driver-api/parport-lowlevel.rst
> +++ b/Documentation/driver-api/parport-lowlevel.rst
> @@ -341,7 +341,6 @@ EXAMPLE
>  			/* Try to detect a device on the port... */
>  			...
>  		}
> -		}
>  
>  		...
>  	}

-- 
~Randy

