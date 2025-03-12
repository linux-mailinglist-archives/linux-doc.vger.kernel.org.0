Return-Path: <linux-doc+bounces-40628-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80841A5E073
	for <lists+linux-doc@lfdr.de>; Wed, 12 Mar 2025 16:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79BA37A4E1A
	for <lists+linux-doc@lfdr.de>; Wed, 12 Mar 2025 15:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34A42505CA;
	Wed, 12 Mar 2025 15:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="DoUrEcNZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sce43T0g"
X-Original-To: linux-doc@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D99A24FC0D;
	Wed, 12 Mar 2025 15:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741793699; cv=none; b=BVTQXqa+kMMYLM/XNkAiRrhkNZCcI7ahgIff+EcCm4xUTTrWcwvD2AzUPrRUxQnOic9OlK6tANXBkEkY2RT1XSI4RAu4jtVmkE/U7HiJoyNQQC+rn5+mD8wU6YGLv8ZCMb4PwpnscVlfHR2ucaoaG01vnHSgkuMj9BbGbH4BNNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741793699; c=relaxed/simple;
	bh=aluHuNWMb5BVFCDJ5FkhtNN27ajOpnn2vCjt7SLRQOs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WVWAyV9fHLze2hnicIgQczV47KtMmTFsj6p6WarGbXjPw3SfdMYSTmd8fTlLT5AOvi8k5IZERaaWPs+CjGRUd/N/KhyOWCw3/XYYifsX9qFAe405q8bdA/ppWAa9gMtqfkJTYY2j4jFG2n6NN4//hTyEz9oW0EoPDqJS5WI3nSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=DoUrEcNZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sce43T0g; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id C075911402AA;
	Wed, 12 Mar 2025 11:34:55 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-12.internal (MEProxy); Wed, 12 Mar 2025 11:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1741793695; x=1741880095; bh=RK6tNQBB5XZwcZW5zCVWQuEe8VmgCG1s
	IPsBwXB+nfI=; b=DoUrEcNZXko497OACsMET/0B2IL576TegO5hTPadeZ2zvUSQ
	w1DfWnfcU8wcOsRyLXLd3jF7I0Va3lxxc5ii4ZN7XFtybrIEHniIkYbt6tzHF8v3
	wbQl/K/hQsiCWRwdjTIZl1M8A9GiRXanbtxX3K3f7mGeoCZBhHzDy7YZbMsrZbCj
	+sprf5Q2rewFzJo4yPq57mMJNuDWH/tlGteqc7lCt1I8jkMQu7uPkjXR7+9sH2I7
	TL99WH5jtJ2dcO4FXVt37ZNX4DLk3j/t2ArNmwgp0TjiNm+6/SnVPPUp+wEp7l4k
	co8nrZoGeHBs0B3yHo3WA1yuGNelVPTnyCx79g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741793695; x=
	1741880095; bh=RK6tNQBB5XZwcZW5zCVWQuEe8VmgCG1sIPsBwXB+nfI=; b=s
	ce43T0gmqrutSUc4nYeVS8eitEZqZQduP+sWAsBWpAi2Sn64+H9S53//MWBmC8GS
	px7soENYhIsvZHiNdzF4kkNGDU94goi60QK/XsB+U9o3avdlgtFS31oBKkNrck83
	mQ/wI7O6cqJ7VlVwKnu47TCzQqZstNj3wJ0C2MagYKFsQvcumdcTYkYJM2ZDTFWO
	Kmy2PL+hoHBdUrKMidk1g84fnJruPQTtY6UUmyswDRcM3GiGCuBePMVlUH9+bvk6
	wEan5yfNCwlDe7F2lXu9qThFKNelUNgQJ8y2PZ06evCcpwLmMCpiRDJB+yBTYjA7
	hET9VGu7TgAdUOAxqNaCw==
X-ME-Sender: <xms:nqnRZ2tt58tZ3nWVRw1iv0BnSoFX1WGmVktE_9c-b6KjWebis58acA>
    <xme:nqnRZ7fUca4yN_7jXQiFZy1rUuT4T0T2qXoZpd3n1lHcWeA_2tWxsOEIr9QwCm08d
    EvTNksmNhirSTzulv4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdehgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvth
    gvrhdruggvvheqnecuggftrfgrthhtvghrnhepgeegheelffdujeduffevfefhieekgeef
    fedukedtvdduhfffjeehleekfeehhfdtnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggp
    rhgtphhtthhopedvvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghpfiestg
    grnhhonhhitggrlhdrtghomhdprhgtphhtthhopehsvghnohiihhgrthhskhihsegthhhr
    ohhmihhumhdrohhrghdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtg
    hpthhtohepugifrghiphgrhigrnhhrrgihudesghhmrghilhdrtghomhdprhgtphhtthho
    pehluhhkrghsrdgsuhhlfigrhhhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhosh
    htvgguthesghhoohgumhhishdrohhrghdprhgtphhtthhopehmrhhiphgrrhgusehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrughmihhnsehkohguvghithdrnhgvthdprhgtph
    htthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:nqnRZxxUqE3Rplw3xxlweXLds8DJOh6Zr3doXOSVQCI9YQLy4HRQEA>
    <xmx:nqnRZxNk8GLe4dfLmNS9ZcdC1iRybpRS7ES5mWCYrWtGq-biz3nygA>
    <xmx:nqnRZ29yCxJhSs4NH8QKghUDCpCcsks-MCWQ6d_j94X7_nCOs2PGCA>
    <xmx:nqnRZ5UP6jiZtrq_Zz9WhBJJk71zSMbYm49xqu5KTeCs3oShLrK5jQ>
    <xmx:n6nRZ8mDE0-hShbs-xZKPMs5xRFge8Uu8DodisB1FE_CZs5B9ojBvak7>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1EB6CBA006F; Wed, 12 Mar 2025 11:34:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 12 Mar 2025 16:34:06 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Aditya Garg" <gargaditya08@live.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: "Aun-Ali Zaidi" <admin@kodeit.net>, "Maxime Ripard" <mripard@kernel.org>,
 "airlied@redhat.com" <airlied@redhat.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Petr Mladek" <pmladek@suse.com>, "Steven Rostedt" <rostedt@goodmis.org>,
 "Rasmus Villemoes" <linux@rasmusvillemoes.dk>,
 "Sergey Senozhatsky" <senozhatsky@chromium.org>,
 "Jonathan Corbet" <corbet@lwn.net>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>, "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "Hector Martin" <marcan@marcan.st>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>
Message-Id: <ff3a9c58-5c7a-4c48-8a9e-cc828a43baed@app.fastmail.com>
In-Reply-To: 
 <PN3PR01MB959715C19BCEA54426D24934B8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <ABAEA9D0-97CB-4ADD-9606-A12D5815335A@live.com>
 <376C9BD3-2F41-4511-BE52-1B8468FE2CB3@live.com>
 <b74df4b5-ecda-45ba-a98a-c84b0a29e380@suse.de>
 <PN3PR01MB9597AC6A02B0BF873920D94CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <9092a9ed-aecf-40bd-9d15-b53d60d035b5@suse.de>
 <PN3PR01MB959715C19BCEA54426D24934B8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by extending
 %p4cc
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,


On Wed, Mar 12, 2025, at 13:03, Aditya Garg wrote:
>> On 12 Mar 2025, at 5:29=E2=80=AFPM, Thomas Zimmermann <tzimmermann@su=
se.de> wrote:
>>=20
>> =EF=BB=BFHi
>>=20
>>> Am 12.03.25 um 12:49 schrieb Aditya Garg:
>>>=20
>>>>> On 12 Mar 2025, at 5:16=E2=80=AFPM, Thomas Zimmermann <tzimmermann=
@suse.de> wrote:
>>>>=20
>>>> =EF=BB=BFHi
>>>>=20
>>>>> Am 12.03.25 um 10:05 schrieb Aditya Garg:
>>>>> From: Hector Martin <marcan@marcan.st>
>>>>>=20
>>>>> %p4cc is designed for DRM/V4L2 FourCCs with their specific quirks,=
 but
>>>>> it's useful to be able to print generic 4-character codes formatte=
d as
>>>>> an integer. Extend it to add format specifiers for printing generic
>>>>> 32-bit FourCCs with various endian semantics:
>>>>>=20
>>>>> %p4ch    Host byte order
>>>>> %p4cn    Network byte order
>>>>> %p4cl    Little-endian
>>>>> %p4cb    Big-endian
>>>> That looks like someone trying to be too clever for their own good.=
 Just my 2 cts.
>>> I don't understand what you are trying to say. Anyways, I thought it=
's obvious, but Petr's Ack is still left and thus cannot be merged into =
DRM for now unless he says so in this thread.
>>=20
>> I'm trying to say that the author of this patch found the %p4cc funct=
ionality and over-generalized the feature. Source code should express th=
e idea of what it's doing in clear terms. %p4ch somehow doesn't do that =
for me. Printing 4 bytes in various orders without context seems arbitra=
ry and confusing.
>>=20
>> (I don't really have a say here. I'm just asking to reconsider this c=
hange.)
>
> Ah I see. I'll checkout the macros you sent. The Asahi Linux SMC=20
> drivers would need these as well, so I'll probably first wait for the=20
> vsprintf maintainers and also Asahi Linux maintainers for their views.

I don't have a strong opinion either way: for SMC I just need to print
FourCC keys for debugging / information in a few places.

I'm preparing the SMC driver for upstreaming again (after a two year del=
ay :-()
and was just going to use macros to print the SMC FourCC keys similar to
DRM_MODE_FMT/DRM_MODE_ARG for now to keep the series smaller and revisit
the topic later.

Right now I have these in my local tree (only compile tested so far):

#define SMC_KEY_FMT "%c%c%c%c (0x%08x)"
#define SMC_KEY_ARG(k) (k)>>24, (k)>>16, (k)>>8, (k), (k)

which are then used like this:

	dev_info(dev,
		"Initialized (%d keys " SMC_KEY_FMT " .. " SMC_KEY_FMT ")\n",
		 smc->key_count, SMC_KEY_ARG(smc->first_key),
		 SMC_KEY_ARG(smc->last_key));

Best,

Sven

