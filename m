Return-Path: <linux-doc+bounces-32239-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B419E7D0A
	for <lists+linux-doc@lfdr.de>; Sat,  7 Dec 2024 00:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7A7A16D436
	for <lists+linux-doc@lfdr.de>; Fri,  6 Dec 2024 23:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC23D1FC0F5;
	Fri,  6 Dec 2024 23:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="J2qxaBQw"
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D4C148827;
	Fri,  6 Dec 2024 23:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733529460; cv=none; b=b8Yzb6Sh3Jzb2gw58fVlEW2GbjUO1dpyXgE3UWaVmF9ga5yG6zF554YcSRmGxFWTfCOZUa+1zB+IOdea4j00wZFDu/wdHGO24IPZooxTN5Azz/IB8P5Rm6B9nh9ZNbe28qIXJvHaHY6UETO6vXYx/bwsWhhrqdyZWEdaT3Z5Obg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733529460; c=relaxed/simple;
	bh=8xtOFjJOMqstJ1JxEUce+LCHopOQXxr3HAsCwYfULAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LCJHkdqe1GvD43sMhgafGTkamKICzkIqDvdQpIVCd1n8Dlc5NZ7kJdg1xLa4FT1eh5wDwqOlCfECki1xUb/uSvyvMW1b80jiBT5E7hh/3XaqxjZuGguubAYfQAsXjKtES1Cn0CcITJS7ycV0DpYftQrUAptpF/a6Y0lyDN9nOzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=J2qxaBQw; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=6CVT3fCHjW+EtyEf2snrM4FnEMzCe5lxg9d7lhPV0Rg=; b=J2qxaBQwDrpKlVwIU9ymGvxU35
	5YDgdNS+IoQkxYyvLoGdRs32vmsDUHm/A9bEE8GlhhVwHG/003I9lVcSYDc6trCJdokqP1QBoDBUX
	O9iRHaXf9gRLslH0f94zcVHKl6fTubWkK4dRB3+3ZRH8S8SuekAneHbN1ZFgdVqUHx+O03AuGffl8
	pgVnkyTy46ZSe6ddkV5snAuEi0BbfZLnJRc2GkqR+czqBTvCNWhb3tpFsKnI5jnQ4ywcq3Rh3LAP6
	qRsSaEa70wLlLoq/FMVrrJnwuNBeePaPtQCug4hZpN0Egl66tj8VLKq5A0cWu+1jQGkYgKVURKyBC
	B9MtveZA==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tJiCR-0000000FAy7-0nVv;
	Fri, 06 Dec 2024 23:57:33 +0000
Message-ID: <0e5dbbbe-4cd8-49d2-a440-7e1acd7d40e9@infradead.org>
Date: Fri, 6 Dec 2024 15:57:26 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: move dev-tools debugging files to
 process/debugging/
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
 workflows@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, linux-debuggers@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net
References: <20241204221720.66146-1-rdunlap@infradead.org>
 <87h67gu5q1.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87h67gu5q1.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/6/24 8:38 AM, Jonathan Corbet wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> 
>> Move gdb and kgdb debugging documentation to the dedicated
>> debugging directory (Documentation/process/debugging/).
>> Adjust the index.rst files to follow the file movement.
>> Update location of kgdb.rst in MAINTAINERS file.
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> 
> So ... since these are indeed development tools, I wonder if we should
> leave a reference behind in case people are looking for them there?

As far as I'm concerned, all debug tools are development tools, so I'm back
to all of /process/debugging/ should be somewhere else.  ;)

cheers.
-- 
~Randy


