Return-Path: <linux-doc+bounces-90176-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CG2JH5SHGpFMgkAu9opvQ
	(envelope-from <linux-doc+bounces-90176-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 31 May 2026 17:23:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBA9616CE5
	for <lists+linux-doc@lfdr.de>; Sun, 31 May 2026 17:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E99043014870
	for <lists+linux-doc@lfdr.de>; Sun, 31 May 2026 15:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7E739021E;
	Sun, 31 May 2026 15:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="RGgutXqX"
X-Original-To: linux-doc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BD030E0E9;
	Sun, 31 May 2026 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780241017; cv=none; b=ZD6jXdTe1GYW9048leoOVBZFUeCkfid0EwqaRPTB16ncmIrOpOUk+H8ytc/2QWbtvxLxibT4m5cf7SckcqoQawb5/DN6TkALh97vxytqR7QmYNCUqotEEsH8duoiJkuj7PjDV2Jg6mzvPTjzgYyO7DbXNrYJ/pPZ6LGAdPFRnHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780241017; c=relaxed/simple;
	bh=9+GoCLTacqFsxBUI4rXF+9XRsxxKX2H6KWw2m2AdVsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPftBNxTumzC0d6f0iUc9FfoSlvNFr9wXGoeWy96fnrZ7fRvXVgFGpLVIGBb5TsiBHIbgmXtAIEKtmNaSm8sDWDi26GzGvB2vSajSu9f/agfie2YkD5WPIYub2i6HSezi2h35KoI1gZZ0FYJOmsRd7kfvS5JWeGe3aIDmDmcJYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=RGgutXqX; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=FVLcp16kWlnIgiT4A2M93BI7rQzuS5B/fT02iYN5hZ4=; b=RGgutXqX4YVefeJ3S1+vO8gyid
	u8+fpadaehkj+v7PFWJfOaXa7GdkZDSGvvGo4DHsFC8X2qb6Z20+SfD9LuTSElgNbJtIdaGCCmPmT
	vW+081yMV8rnpOLbh+gS3YGhkkvd56tj07qd//1h/MKa2eru4nF4DMfDciazWCALEM4I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wTi0a-005N5o-71; Sun, 31 May 2026 17:23:24 +0200
Date: Sun, 31 May 2026 17:23:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Cc: Piergiorgio Beruto <Pier.Beruto@onsemi.com>,
	"parthiban.veerasooran@microchip.com" <parthiban.veerasooran@microchip.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v3 14/14] Documentation: networking: Add
 timestamp related APIs to OA TC6 framework
Message-ID: <53d5f13c-7095-49ce-bfa6-fefee9e0c4fe@lunn.ch>
References: <CY8PR02MB9249D1ECBA54A1083D404A6D83162@CY8PR02MB9249.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY8PR02MB9249D1ECBA54A1083D404A6D83162@CY8PR02MB9249.namprd02.prod.outlook.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90176-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[lunn.ch:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:mid,lunn.ch:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0FBA9616CE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> +Register the PTP hardware clock related functions with the kernel. The module
> +simply registers. Hardware timer related functions are provided by the vendors.

This last part should be expanded. Please document what is actually
needed from the vendor code.

	Andrew

