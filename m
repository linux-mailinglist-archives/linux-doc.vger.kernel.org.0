Return-Path: <linux-doc+bounces-26884-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF94996416
	for <lists+linux-doc@lfdr.de>; Wed,  9 Oct 2024 10:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C59EA284446
	for <lists+linux-doc@lfdr.de>; Wed,  9 Oct 2024 08:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3217A1925A9;
	Wed,  9 Oct 2024 08:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="VIyhovJL"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A5B192598
	for <linux-doc@vger.kernel.org>; Wed,  9 Oct 2024 08:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463890; cv=none; b=E7Yr9/bplqdBY3C8irt9y/wSDepZEmiNeKcX8bL+/P8cCop5F/RkZRqelcvgpQn0SUAsplq48z5BFle9TWFeup3hpriHHWGUR5CQdNCVh6+q3EpqtfYMXz0Isu8Eljk7waOE13Z39ZKgOdJJdYD4dzN1N7SEdV0EV2Ll+nRCzN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463890; c=relaxed/simple;
	bh=F7SbP0Gkpb6hTGIKeHIh3SLW4Za0d2+J9HFZIgm6ABM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPhVUVev8zungnAlvmfdyweSuAD9X/y2Hn+CEeZPeoyQE0ijAKTJgqpKn9yRKfq5/0kNa6wTM3Jzj3ufqzkN1P31G2qWrodwI2nbD+vr41TkOqOJiV3SHbMZaPA02FyUP1elPNcycrulDLziWviK4gf77lX+iNpzQE6dTLnI8Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=VIyhovJL; arc=none smtp.client-ip=62.149.158.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Received: from [192.168.1.58] ([79.0.204.227])
	by Aruba Outgoing Smtp  with ESMTPSA
	id ySMgsnKqdwy3rySMksrqam; Wed, 09 Oct 2024 10:48:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1728463698; bh=F7SbP0Gkpb6hTGIKeHIh3SLW4Za0d2+J9HFZIgm6ABM=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=VIyhovJLV/7MPr3nl3pR1YFKS9cL5CMzNfArhsVFMeZIIByfwwbsUisa4+vyHUzwa
	 +BDteqyhTw1yt/xLKUs1fl/w1BdkP3/WEti8/TH4n2rcRSl0nl42nIiva31p2FAtos
	 MRCP3NRnefn5FnObIC/QKjw0ckNLAPDsTTQWqMkWGhXHtWRKfagviqaUdHn4zjPMXu
	 KDsb/TGqLyh1iI5Xb0gn1j24Dv8sVpwjIJWOUpzW+r+GS2VMclBwNoajuwQ4vJ6s2C
	 zPm6l3IjdZ6aOwLRLI2rB3M9jZujAe5hGSxXlT9vQzXJgEJd/0/q1gRV9swEFAg4VB
	 uFng3JeCk3ctA==
Message-ID: <fcb082fd-2572-4782-b9e2-69cdbc22714d@enneenne.com>
Date: Wed, 9 Oct 2024 10:48:18 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/3] Documentation pps.rst: add PPS generators documentation
To: Greg KH <greg@kroah.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
 Hall Christopher S <christopher.s.hall@intel.com>,
 Mohan Subramanian <subramanian.mohan@intel.com>, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, Dong Eddie <eddie.dong@intel.com>,
 N Pandith <pandith.n@intel.com>,
 T R Thejesh Reddy <thejesh.reddy.t.r@intel.com>,
 Zage David <david.zage@intel.com>,
 Chinnadurai Srinivasan <srinivasan.chinnadurai@intel.com>
References: <20241008135033.3171915-1-giometti@enneenne.com>
 <20241008135033.3171915-3-giometti@enneenne.com>
 <2024100850-stunned-curve-2ba4@gregkh>
From: Rodolfo Giometti <giometti@enneenne.com>
Content-Language: en-US
In-Reply-To: <2024100850-stunned-curve-2ba4@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEwbNNZ2dn1aV8c8238Lr98QHpTvWZQvQB+B2HayfARdf+BloeeCvJcZB7SheO8LO+cDraYWtRIouBMeOPiam4Lk6FEHrglFfrUNWPnN5GCJLYN4vi6M
 89ToOswrdmZE9I0c+6PAgUe3+CpLD9cJ2HytqhNVTCKtG6d97X2gLuJ62ifSqIts/tLf/9FlMXTdnjpWDq4V6GxeKkv1klB/oV63ZazSt8Bee3gC//s8HSix
 H132MI5FD2AtVPUWpZxsLbYy3V9sSfg8PoNBn2CY3rSHkVhk/PUk8BlbqDulBSt6CrzbO4CuJQdfYwYT0SOH7honx3rl6bTRBSP7vVhHHRR9ZnjTCj3t88As
 w75GKyUraG9iuvN/R7fgavJXvW8Uh+Sq0rmw6G2KHqas7CbuymjroiNnowGp73H4YHoPauo1O3UZpLq7wzAmcfZJDc3gDkCwWGVX26fV/1pmJKoPbvjjuqOn
 nHw6bFlWXNXwd+lMXb9IPg6pMEA+Ae/RVWSfaoqREe7sQtWvDN64+96JWrDi07vl5PDVfzVT1ObYZisJ+4uL2csvj9Nz/t6XOHfzowqVXuhxREYl0Q73E31O
 JO4F8dwlE5fDObLzQBuzxSNDyW0yX1CaP5qtyj/hzaoPCbfeqOUkQ6E7A9GFp/vZK/ufuJGWHAi9JZ5vHf8bxhFN

On 08/10/24 17:43, Greg KH wrote:
> On Tue, Oct 08, 2024 at 03:50:32PM +0200, Rodolfo Giometti wrote:
>> This patch adds some examples about how to register a new PPS
>> generator in the system, and how to manage it.
>>
>> Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
>> ---
>>   Documentation/driver-api/pps.rst | 40 ++++++++++++++++++++++++++++++++
> 
> All of this can go into the .c file and autogenerated there, no need for
> a separate .rst file that will quickly get out-of-date.

I see. I'm going to add proper documentation within .c files. But since some 
references about PPS generators are also present in this file, I think it would 
be wise to add some notes about the new interface...

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming


