Return-Path: <linux-doc+bounces-87569-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJlBLkN+BmrnkAIAu9opvQ
	(envelope-from <linux-doc+bounces-87569-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 04:00:35 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B175489A7
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 04:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BACA303850B
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 01:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A796B30C37A;
	Fri, 15 May 2026 01:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dNr8DHoE"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAAF2F3621
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 01:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778810295; cv=none; b=II4xl4t/AUmTYYR2M7MTz7KShMQSojoukRIwCpcIcLR0+IIwVzdgmdDsPpcfZ3+racrfByYVL8vh8XcidzaAzumkG31Qr4HnTkR1sa0OtGrLrqseOQOWKQmglZpR7uwUcukgIBwT2ZDTB9WEJrTSMFFh7ZgROjN90yE+W2RpWww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778810295; c=relaxed/simple;
	bh=L4t+uQSIrWGHIHj33V/zbdEN0TXp0yNGvzeXCY0pJoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0S1Gp9883D15Kd/iYEs9O36YFy6My9iZnFbRCCWy6Qt9oFDzOLeT8FM3abYAVcfKI0BIGFxzcO0YWlXBt4OMZY54VH30TIYVmyrpv4msXbYKMgzs5uMwR5Fc3eOil9Pk7HJqF72fnRfC3UxPxkwFuk/ZZ1RRHQPDovmiYcan7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dNr8DHoE; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=qQNIhZUx3WLFDRMgSL/B4XE+n8adzpdyE5ybMWI0sqs=; b=dNr8DHoEV7PGAWMYmSyfotxwmx
	Wv7uS4lS9gHcrLS98lN6zG3Oyni1yxoSOOsvF0Aiye7rDft8WlWXRn+rRdplYkt4ZmEkVFwYFMG9g
	E87nZ09xo1Du75rqcM34oaHrZB7v12VqGW8dIcvMiNcJ1Q8Rw8f7LnFpA8pgm5wIkl/PHg0LWGpGP
	EeYau0ZehItx265C6Z+tn1prQDqXEh1pjEGC4OWZal+TmtlRTaX79XcGVAJAUe/KJvNaAvBQxCxLe
	u8ppufWwpCJF/7WNCI560yhgBfEP7P5pcLMSHlANlKHsh4xpkK9oa+LkRwUB4sAXGxU6hMjYVvJ0X
	/NlOKhgA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhoX-000000074E9-34CE;
	Fri, 15 May 2026 01:58:10 +0000
Message-ID: <1ff1d237-fd32-4373-aaef-d19743bb2ea4@infradead.org>
Date: Thu, 14 May 2026 18:58:07 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel-doc no longer warns about leftover argument doc?
To: Jakub Kicinski <kuba@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org
References: <20260514184948.3fa705e1@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260514184948.3fa705e1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 36B175489A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-87569-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action



On 5/14/26 6:49 PM, Jakub Kicinski wrote:
> Hi!
> 
> Looks like the new python kernel-doc does not warn when there are
> stray arguments in function kdoc. Eg
> 
> /**                                                                             
>  * ksz_wol_pre_shutdown - Prepares the switch device for shutdown while         
>  *                        considering Wake-on-LAN (WoL) settings.               
>  * @dev: The switch device structure.                                           
>  * @wol_enabled: Pointer to a boolean which will be set to true if WoL is       
>  *               enabled on any port.                                           
>  *                                                                              
>  * This function prepares the switch device for a safe shutdown while taking    
>  * into account the Wake-on-LAN (WoL) settings on the user ports. It updates    
>  * the wol_enabled flag accordingly to reflect whether WoL is active on any     
>  * port.                                                                        
>  */                                                                             
> static void ksz_wol_pre_shutdown(struct ksz_device *dev)
> 
> 
> AIs seem to catch it but that's not ideal..
> 

Yes, hopefully we can have this patch merged soon:
https://lore.kernel.org/all/20260507023232.4108680-1-shuicheng.lin@intel.com/

giving:
Warning: init/test001.c:13 Excess function parameter 'wol_enabled' description in 'ksz_wol_pre_shutdown'


-- 
~Randy


