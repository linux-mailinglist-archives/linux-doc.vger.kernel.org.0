Return-Path: <linux-doc+bounces-34054-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF90A0288A
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jan 2025 15:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 087C51640E1
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jan 2025 14:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04C586359;
	Mon,  6 Jan 2025 14:51:53 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA568634A
	for <linux-doc@vger.kernel.org>; Mon,  6 Jan 2025 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736175113; cv=none; b=XEjPdCf61G7X+VY/NCyQh+YBO48F4cZ3fcd+1viLFEqH4C4frSWjCKF7AWe+9aLUtPOEZl54OjMOYVkDhqO3QZiRzGULmnRVEBUtQwxjOtH9W9rND4pjlM9nRDcV6vPxGfHGHU0knNc09Do+x82C5l+nPr5eQlwDj3h9jJ9jxIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736175113; c=relaxed/simple;
	bh=AYH/DfLSVgqLvfrtVkQLR326FQZjIqBODaw1Gcw5CHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qAXTw5SMo4zk6KTigGM2/s5cbErekxNEuhzymKsbyLZocEv4gk4dblXlzuQnu0aSmzfOmePqgLlpn9KWlw3BVQWT1rlG1khndveAd/C5x9cDixK6XkTYAChNSKayOsNxNX9hLf6ozuNqR/BAe1BqYCEhfiDKZ5TMuJNV2s5DMjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUoSJ-0002GT-91; Mon, 06 Jan 2025 15:51:47 +0100
Message-ID: <adf12374-30e1-48bd-9f73-fabc5a8c2357@pengutronix.de>
Date: Mon, 6 Jan 2025 15:51:46 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] docs: process: submitting-patches: clarify
 imperative mood suggestion
To: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Rob Herring <robh@kernel.org>, Frank Li <Frank.li@nxp.com>,
 kernel@pengutronix.de
References: <20241220-submitting-patches-imperative-v1-0-ee874c1859b3@pengutronix.de>
 <20241220-submitting-patches-imperative-v1-2-ee874c1859b3@pengutronix.de>
 <87r05p10bt.fsf@trenco.lwn.net>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <87r05p10bt.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

Hello Jon,

On 30.12.24 19:40, Jonathan Corbet wrote:
> Ahmad Fatoum <a.fatoum@pengutronix.de> writes:
> 
>> While we expect commit message titles to use the imperative mood,
>> it's ok for commit message bodies to first include a blurb describing
>> the background of the patch, before delving into what's being done
>> to address the situation.
>>
>> Make this clearer by adding a clarification after the imperative mood
>> suggestion as well as listing Rob Herring's commit 52bb69be6790
>> ("dt-bindings: ata: pata-common: Add missing additionalProperties on
>> child nodes") as a good example commit message.
>>
>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> 
> I'm rather less convinced about this one.  We already have a whole
> section on describing changes.  Given that this crucial document is
> already long and hard enough to get through, I don't really think that
> adding some duplicate information - and the noise of more labels - is
> going to improve things.

Do you agree with the content of the patch in principle?

My changes were motivated by a disagreement about the necessity of having
to use the imperative mood throughout as I described in my cover letter,
so I still think think that a clarification is appropriate.

Would a v2 without the example at the end be acceptable?

Thanks,
Ahmad




> 
> Thanks,
> 
> jon
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

