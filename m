Return-Path: <linux-doc+bounces-81810-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBSFNVU1y2l1EwYAu9opvQ
	(envelope-from <linux-doc+bounces-81810-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 04:45:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D3732363881
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 04:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DAE6E3014889
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 02:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D0436AB7B;
	Tue, 31 Mar 2026 02:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+jutgsu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9CA1925BC
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 02:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774925136; cv=none; b=ZrRjXWwOKmP7fCkoRAa50jp1dR0efIvyP0YgkFsDXdljmaotvyYgcXGBW9cYbK4N08Y9B13sNBRfVtpbBhB7ZPhco2rSJDM4I5kKLD8+8usjtT0SlnpnWc07oQ7EOYS3TbpdOCXnZVz93Y/thL2Jlyx2dg9OyOgX88GBsCYbEQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774925136; c=relaxed/simple;
	bh=gmtb6ym3rJB2TqsSBmD6+u3N3aYS8mmxlZ0jn2rBerw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igMwCuxeonLMbkUSV+tgQX0YYk/elgidh9LwBcJNQLxtvrsMz9Ho4ovIM/o2hV0GPxJJ10m//i3n5PC4I3PgDkIT0HSZGURmIhKiKdagNdbCmc5WWbUfwaFF4hX9EdHXut27Fzx4pJDYnXWBiMRavyOxG9k1dOHr44RE6VXg17w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+jutgsu; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c4db6bca03so1099265eec.1
        for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 19:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774925134; x=1775529934; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DuywKr5fh3r0GTQPzJ6SVafxalXSHpADk5mdAupw5a0=;
        b=R+jutgsugL86b0a+PgIItrmOWH2G39KQiTEaYhxm4wjldEBlo6lDgr04nhuQh72VEZ
         QWwd9VIVFCKyIyfXpWAE5U5AmNFXOoH9/nd6B5VrPr2zG3Z89abr7toF3dwY33GutL10
         sfyPQVsvg7h8KL7KikaFyUOF7a1hglKpXaz2DjrSdkLnnZ2ihS9Usc/FUbBVcODqlAoq
         tKYv70EMC/JeIBwtUpMi+vva4SQVTTUltTYpPNCVeIUtNcpiqLzv2n0K7Xp00s2TJiUQ
         xvdbpoh4718dYBizsbNkq5OcFS7/UnSk7MNuYByQPU5cQKG0fnuk9k6BzDUMStayHkTr
         faIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774925134; x=1775529934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DuywKr5fh3r0GTQPzJ6SVafxalXSHpADk5mdAupw5a0=;
        b=LPLWrE0eNL37oGfWIluQMbAou4khz/VXteZDNP9/N0S0OCcsNA1hHEpZwRpBsrIBJO
         US7JNLN6X5luYVoecB3NCRdGTrtGmrJwOBcrB+UqA0d5DYd6eJyT5OxfLUb6qrfURy3s
         OyeMymjx7sRtCbDYir0xAFwPbI6NPkjc2mkG8dbbOaXEfMrxrOnSKY0BLYvV4ha9Db2e
         etJObaANFPgLg27YKg3brtHLIqa9VALg5Dr66aXtDcju7fnuH07QnUl6JprL2hZK2Mh9
         E8ddn/EYyQaiiRgWYK3phENycyBBNpBeZ4B/irjcBeuB7Q9/r5JUtNeVulNknww+r/AD
         E6uA==
X-Forwarded-Encrypted: i=1; AJvYcCX5a4KLUK2ADQvMC8+8Ay0Yg5Et5RnIL5Ovz3umhYOq/y65m9VPBR65vWUUjmhEuHOQTIAIcTjHGrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YztohSRWGcPcScdGWyQC4dgGBnWd4ueeSUVwxs2paXuppevgejJ
	TPWjz4N7zEBAoeN05GpBeMDRRJ0rbSglx9crYaYGO2SQANXY5U0CTRKp
X-Gm-Gg: ATEYQzwNLA4hmCOEkFouHD+ByOKmac9kDv3AooNJGwWfv/ljHPoNAlpApjo0bIR265Z
	jI54jSEknczkIsj+HNMYpyb4X0yDXQJkSEFeO8OnJ0ETJgCD/m7fy0xG4wNWdwDDFiLP4Q+D31e
	kkD1JHxlyzADqOGtw5L+cUcMDP8akff0fFv51Pc4VaiMDi3UES93A5+VDfV0AgvoRkwAvYwtGjv
	1hujouE/6EJmdo/2tA1aP0I7dJor9iiVq1znil854emopDMHHrThQBaY9OviH7OWBS/J3iADuNV
	qKTLt5kV6Ucc646fBfSGGlhgb9Ve4IGPU1BDUa46dHjJcQQlwQONYluKirZz+pHLw2F2r2DAbIH
	7H0Knu9rsUSqJY2iRH3Qy1/SCufQR1Zi+THFcRNXGYatLk8qYMbMUM9KzYHrR/yKJtz4FY0Tzhx
	EiI47RinnB0V/16dLIE+BFzaY7e6ND7Vk+69jx
X-Received: by 2002:a05:7301:2b05:b0:2c5:6140:54d6 with SMTP id 5a478bee46e88-2c7baf441dcmr1032879eec.1.1774925133805;
        Mon, 30 Mar 2026 19:45:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c68b249fsm8763549eec.19.2026.03.30.19.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 19:45:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 30 Mar 2026 19:45:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Sergio Melas <sergiomelas@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH -next] hwmon: (yogafan) fix markup warning
Message-ID: <abe8e17d-48e3-4d1f-b9dc-1158b4df2d37@roeck-us.net>
References: <20260330214624.3781789-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330214624.3781789-1-rdunlap@infradead.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-81810-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,roeck-us.net:mid]
X-Rspamd-Queue-Id: D3732363881
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 02:46:24PM -0700, Randy Dunlap wrote:
> Add a blank line between the License and heading lines to prevent a
> documentation build warning:
> 
> Documentation/hwmon/yogafan.rst:2: WARNING: Explicit markup ends without
>   a blank line; unexpected unindent. [docutils]
> 
> Fixes: b773f2e6b472 ("hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied.

Thanks,
Guenter

