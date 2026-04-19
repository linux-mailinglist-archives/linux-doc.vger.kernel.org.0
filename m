Return-Path: <linux-doc+bounces-83840-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOrvENxS5Wn0hAEAu9opvQ
	(envelope-from <linux-doc+bounces-83840-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 20 Apr 2026 00:10:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBBD425A16
	for <lists+linux-doc@lfdr.de>; Mon, 20 Apr 2026 00:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AC4D301B726
	for <lists+linux-doc@lfdr.de>; Sun, 19 Apr 2026 22:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F2D2F5A12;
	Sun, 19 Apr 2026 22:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="FutQJw28";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vd/XTF3T"
X-Original-To: linux-doc@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8042E218ADD;
	Sun, 19 Apr 2026 22:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776636633; cv=none; b=gGy/G+ol929JYlG3uOavm3YIf0Bil49YMv5D+P7nmTQDnvrgAHvPusDPqyxebTdGMxHIph3ZbhV73OyYykQUhkl2F/5GFgrdCBw1meQU8cfhZw0ltrjlpZ9edNGMLETHaKW9bUo0qCwqMwR5M3WV0+bdRmx1iHTXAJkQMAlMcMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776636633; c=relaxed/simple;
	bh=hCBtdPf9RjQ3ObbW9oa4vAuiyqv3ryG2GcwBmj+BBdE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=l18s8P/f17U442M0vRfiA5B8XpIt51T3wFTLUSIjLfvNqOoZxSkxmnTqD0TZKqIq7cr+qeSbUt0iE2KvNT3hCrTutDHDMj6bMkABdTR8Izee+Orb4v+aurBkr0PV/YmrU0oHCVZITmXkMTERvw31UVm4PxB90jbT9OqIbrNYzvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=FutQJw28; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vd/XTF3T; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C58AA14000A7;
	Sun, 19 Apr 2026 18:10:29 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Sun, 19 Apr 2026 18:10:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1776636629;
	 x=1776723029; bh=rFkd2WdJ+FVyOXY1EUv5Gki37/4tABHQ3mRheY4SK+k=; b=
	FutQJw28V49F4uN8E8Fu3uRRyxijO73RzZ0QMAsYF+bu0HXNfIIoPfdPN43XtPBi
	CuKlmyyL9EW9AXh4Vj0/xuRrsun2ind2mYjNmkFYDHGrfiEOOLK+iIVuBugQ4jXp
	uYMhVAFu19QhW46UHP0rLGWUZb+b53KtdNS/7E4iLm0fDxZeLI7hZWwTziFiep2K
	XBh2nl6WlRKDqZ9Wf/U413EP3xpclQTdkISQCs/rPnxWnibGvqc/wgl69qJR2MyX
	HMl3ufUUvdrN7sB2P9QmBxJPvGxdexjQAsE1SbMWwOpUwAEsWn+zzGNB8/zwY2r7
	GxP/PtUmMd9QMXEZLVQufw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776636629; x=
	1776723029; bh=rFkd2WdJ+FVyOXY1EUv5Gki37/4tABHQ3mRheY4SK+k=; b=v
	d/XTF3Tk0YcKGtYv+U29sAwOccoPDRqS9vcqGDs9SMriBSVimn0ALHPm7qMdjj7I
	bYWZz+EhUQT28huTjAxvey1W2H8UX8F7yXepI6TZZZaFPFJWeLAwftRyrLxqUs86
	ubvGucWpCTUcBwg2FBuCa2R6m6Qr/h0vmP+/JZf0vHC1qXQzS8Pfeo4npflEL9lN
	bgvI3vm8/Yb15HsugExAC/ZIzb9SUKa47KGnyZwZvJfqEQbKbG8ycrXSrL2Vu/xt
	PA5Ok3VCI6yWoVy5AzJFj1tF0DmSb91GnWYYZ7qAPasooUDNWRQg8Ewr03GDyCJ7
	WXr1P4iezg7+5ANlOCsHQ==
X-ME-Sender: <xms:1FLlae3XKB7bA0o48JuhLHTCk7ztVdb26i5f4H482Wbb0IhadXO-MA>
    <xme:1FLlab6xbfndxW3bdqRJ5j3r0IJg5Re3w_pxipul-Wdxy3q46SAycW8W5iv3vXkUq
    BAKlj18sL03VlfACswSVgBDYknRPjAeND0Y6d29OQN0m8a9A7Tcd7o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehieektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnhepudefgfelhefgveffheehuedtudefffetiedtvedthefg
    vdeuvdefgeeiiefhieegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdq
    lhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopedutddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepmhgvsegsrhhighhhrghmtggrmhhpsggvlhhlrdgt
    ohhmpdhrtghpthhtohepuggvrhgvkhhjohhhnhdrtghlrghrkhesghhmrghilhdrtghomh
    dprhgtphhtthhopehnihhnrggunhgrihhktdejsehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepfigprghrmhhinhesghhmgidruggvpdhrtghpthhtohepshhkhhgrnheslhhinhhugi
    hfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdq
    mhgvnhhtvggvsheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopegtohhrsg
    gvtheslhifnhdrnhgvthdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:1FLladi7VfckJsrL2W5xtwuFLLQgZGVvjsUOM0KjcXPFmdUjv3Cqnw>
    <xmx:1FLlaQSR3TPFWu2ZsFqD5WzrkKNdGTz6Wo2MnSa_L4ekG5KyDAORRw>
    <xmx:1FLlaWaankT6ErbNm0640f-NllGvYvw6FzFI7cpsSX_vfYlfVIdx1A>
    <xmx:1FLlaVQ0LHe-h9mXK_J-Sx08E8316e9g4d9tK12dxtkfz0-zu22qVg>
    <xmx:1VLlaSAIHvscsbrn_yNZA4zSi8bFg2y8U0_NvUfLj-5_VV_JxuTKB7tc>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 77DC52CE3F94; Sun, 19 Apr 2026 18:10:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ab0JQVG51Pnw
Date: Sun, 19 Apr 2026 18:10:08 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Ninad Naik" <ninadnaik07@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, "Armin Wolf" <W_Armin@gmx.de>,
 "Jonathan Corbet" <corbet@lwn.net>, skhan@linuxfoundation.org
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 me@brighamcampbell.com, linux-kernel-mentees@lists.linux.dev
Message-Id: <b94cef14-d02d-4544-abb5-ead7db6eaa72@app.fastmail.com>
In-Reply-To: <20260419170835.347910-1-ninadnaik07@gmail.com>
References: <20260419170835.347910-1-ninadnaik07@gmail.com>
Subject: Re: [PATCH] Documentation: fix spelling mistake "Minumum" -> "Minimum"
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[squebb.ca,none];
	R_DKIM_ALLOW(-0.20)[squebb.ca:s=fm3,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-83840-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,gmx.de,lwn.net,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mpearson-lenovo@squebb.ca,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[squebb.ca:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,squebb.ca:dkim,squebb.ca:email,app.fastmail.com:mid]
X-Rspamd-Queue-Id: 4EBBD425A16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On Sun, Apr 19, 2026, at 1:08 PM, Ninad Naik wrote:
> There is a spelling mistake in Documentation/wmi/devices/lenovo-wmi-other.rst.
> Fixing it.
>
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
> ---
>  Documentation/wmi/devices/lenovo-wmi-other.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst 
> b/Documentation/wmi/devices/lenovo-wmi-other.rst
> index 01d471156738..1d0410500d3f 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -144,5 +144,5 @@ data using the `bmfdec 
> <https://github.com/pali/bmfdec>`_ utility:
>      [WmiDataId(1), read, Description("Mode.")] uint32 NumOfFans;
>      [WmiDataId(2), read, Description("Fan ID."), 
> WmiSizeIs("NumOfFans")] uint32 FanId[];
>      [WmiDataId(3), read, Description("Maximum Fan Speed."), 
> WmiSizeIs("NumOfFans")] uint32 FanMaxSpeed[];
> -    [WmiDataId(4), read, Description("Minumum Fan Speed."), 
> WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
> +    [WmiDataId(4), read, Description("Minimum Fan Speed."), 
> WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
>    };
> -- 
> 2.53.0
Looks good.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

