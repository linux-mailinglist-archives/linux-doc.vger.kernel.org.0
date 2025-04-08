Return-Path: <linux-doc+bounces-42627-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA3DA810CF
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 17:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C37B21BC19EF
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 15:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6952A22CBD2;
	Tue,  8 Apr 2025 15:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="w8HKgmbF"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6221D22DF8C
	for <linux-doc@vger.kernel.org>; Tue,  8 Apr 2025 15:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127420; cv=none; b=TizUxmCERRJvjNJOKbYx/5z3jc37Kbka3u5Yi7fkICAVkILbgV66sXpNwslEVd/E61i0H4H8eIw6NZcitcG05vnKt5xG2LUe+opU9lOsT5XLymkTgrQ6LSqX58KvsNLGRFvgGdPoTv1C96/YarZF1InpNU/SxgslnztNlvPJHQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127420; c=relaxed/simple;
	bh=j47vGAAtksccEUYr4w4LdgceuKnPRkuIL9WLW+TNwfc=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=fQufnA03/wvoBXAL4xr+d9gtOijry1NmSIWLIh/QfpBrbB+SKeIsz0Kl8bZWjVGem6dhiWXhTWaFpWWo5fLYiCuJE8TdTh4bQycvOfwuPiNr4Mvz2558A7+Jo7+IPtaFbanIatC48aFSPVwqtkEZP18EI/awpcfjy0okVbg4HOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=w8HKgmbF; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744127405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1JxA4fI6xIrcW42/17J5BLUCCtQy1R9vPzLmio89gWM=;
	b=w8HKgmbFDA6me6xLQKYCtHsgTBQJkZUNMZoPezGQlJYXmJp0SwFCxZRgz3lUUDED31Q3qC
	33OiRkxRXOoYTzUOvEe73DP6TC6diypGj6WrFTQgZglu9lEKYeT4Ev0FIzOtWbx7Bj1RFW
	EEE7J6OCdK5oPDjDCJsONpWPB/Ywj+0=
Date: Tue, 08 Apr 2025 15:49:59 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Jiayuan Chen" <jiayuan.chen@linux.dev>
Message-ID: <a3e08ca65f86dac1f741ef002af2feac69537041@linux.dev>
TLS-Required: No
Subject: Re: [PATCH RESEND net-next v3 2/2] tcp: add
 LINUX_MIB_PAWS_TW_REJECTED counter
To: "Jakub Kicinski" <kuba@kernel.org>
Cc: "Eric Dumazet" <edumazet@google.com>, bpf@vger.kernel.org, mrpre@163.com,
 "David S. Miller" <davem@davemloft.net>, "Paolo Abeni"
 <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Neal Cardwell" <ncardwell@google.com>, "Kuniyuki 
 Iwashima" <kuniyu@amazon.com>, "David Ahern" <dsahern@kernel.org>,
 "Steffen  Klassert" <steffen.klassert@secunet.com>, "Sabrina Dubroca"
 <sd@queasysnail.net>, "Nicolas Dichtel" <nicolas.dichtel@6wind.com>,
 "Antony Antony" <antony.antony@secunet.com>, "Christian Hopps"
 <chopps@labn.net>, netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20250408081930.2734169c@kernel.org>
References: <20250407140001.13886-1-jiayuan.chen@linux.dev>
 <20250407140001.13886-3-jiayuan.chen@linux.dev>
 <CANn89iJRyEkfiUWbxhpCuKjEm0J+g7DiEa2JQPBQdqBmLBJq+w@mail.gmail.com>
 <46c9a3cd5888df36ec17bcc5bfd57aab687d4273@linux.dev>
 <20250408081930.2734169c@kernel.org>
X-Migadu-Flow: FLOW_OUT

April 8, 2025 at 23:19, "Jakub Kicinski" <kuba@kernel.org> wrote:

>=20
>=20On Tue, 08 Apr 2025 14:57:29 +0000 Jiayuan Chen wrote:
> >=20
>=20> > When TCP is in TIME_WAIT state, PAWS verification uses
> >  > LINUX_PAWSESTABREJECTED, which is ambiguous and cannot be distingu=
ished
> >  > from other PAWS verification processes.
> >  > Moreover, when PAWS occurs in TIME_WAIT, we typically need to pay =
special
> >  > attention to upstream network devices, so we added a new counter, =
like the
> >  > existing PAWS_OLD_ACK one.
> >  >=20
>=20>=20
>=20>=20
>=20>  I really dislike the repetition of "upstream network devices".
> >  Is it mentioned in some RFC ?=20
>=20>=20=20
>=20>  I used this term to refer to devices that are located in the path =
of the
> >  TCP connection
> >=20
>=20
> Could we use some form of: "devices that are located in the path of the
> TCP connection" ? Maybe just "devices in the networking path" ?
> I hope that will be sufficiently clear in all contexts.
>=20
>=20Upstream devices sounds a little like devices which have drivers in
>=20
>=20upstream Linux kernel :(


That makes sense :).

Thanks.

> >=20
>=20> such as firewalls, NATs, or routers, which can perform
> >  SNAT or DNAT and these network devices use addresses from their own =
limited
> >  address pools to masquerade the source address during forwarding, th=
is
> >  can cause PAWS verification to fail more easily.
> >=20
>=20>  You are right that this term is not mentioned in RFC but it's comm=
only used
> >  in IT infrastructure contexts. Sorry to have caused misunderstanding=
s.
>=20
>=20--=20
>=20
> pw-bot: cr
>

