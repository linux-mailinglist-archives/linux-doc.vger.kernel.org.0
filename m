Return-Path: <linux-doc+bounces-30938-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D779CFE60
	for <lists+linux-doc@lfdr.de>; Sat, 16 Nov 2024 12:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15E101F241CD
	for <lists+linux-doc@lfdr.de>; Sat, 16 Nov 2024 11:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1A6194C6A;
	Sat, 16 Nov 2024 11:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="3gfJGmh9"
X-Original-To: linux-doc@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBB379D0;
	Sat, 16 Nov 2024 11:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731755238; cv=none; b=jnDqxDVt1kpu3r0UJd8h+/vkR/5WP8hP0Lusfk+395AqJ8KWHBZ4cxIonzQY1Xh6AaNMTNav9hFKDpMeLyIbMy00DC9STm4/tbiasMmlLznX8VhB1+B3gA+I1Hp51Egyt/BUZnn6/RcNfDgD1vriuRlwK0PbBbYDAY02YV/rGHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731755238; c=relaxed/simple;
	bh=w15SoKEG8fQlIl1AwhNNRc0F6jo89B7cHBcFagI5Z8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AnHn6KRNw0Re8sfsW/ioHo+YwSaz3D5V+hiwMzv0Ji5T5+og0mmuIxEEsQLHsK4kTrP8v7Rpm1RUhyqlCIPtx/TEMAPJway6GRNR1qDa8Y8OYZLQ15e/4tVo5M9dxwy2tNEqkFKCV3PHh+a/pMzEMnlcvnjscWI5K9r+Eb5LQ80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=3gfJGmh9; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=A/Hm+VoVACku5wCmYcv0fniecfViC4thm9PdkGpQZpQ=; t=1731755236;
	x=1732187236; b=3gfJGmh9U1RW+WpABPiFRExnPah6Lqx5Om3IV7Dopnu2MucBWdzCi1TDeAf/h
	5/Hm0k4AwqoaG9AV3A4dSXhQGnbziD60fP1K6SczMlLkPneiiY1fZTt2kQuEC+S4b4eG0V2KSoO1A
	boNvd35Vyrbk5IP5I5GE5KsnFoM4KKykAosO99K81S5tHSwK+CV003VHAP60NTBp/PaqH2XNtlrmy
	6WoYrJQ2MidasTsa0ePHnyBBOVmVj3V/DS9RJjy43/x9cT68I/LiFft2ETu7K1iyvpZ4AOyRF4/11
	ybfhsi0NqCsjDlTT47ACC5X/PAUSrKBfsYxGE1Cadnt8S2yxyA==;
Received: from [2a02:8108:8980:2478:87e9:6c79:5f84:367d]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1tCGdy-0002do-CT; Sat, 16 Nov 2024 12:07:10 +0100
Message-ID: <ce6c0fcb-0df2-473d-8286-dca67ba15066@leemhuis.info>
Date: Sat, 16 Nov 2024 12:07:09 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] docs: clarify rules wrt tagging other people
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <cover.1731749544.git.linux@leemhuis.info>
 <b7dce8b22a391c2f8f0d5a47bf23bc852eca4e71.1731749544.git.linux@leemhuis.info>
 <2024111651-slather-blabber-857f@gregkh>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: en-MW
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <2024111651-slather-blabber-857f@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1731755236;680ff08e;
X-HE-SMSGID: 1tCGdy-0002do-CT

On 16.11.24 11:42, Greg KH wrote:
> On Sat, Nov 16, 2024 at 10:33:59AM +0100, Thorsten Leemhuis wrote:
>> Point out that explicit permission is usually needed to tag other people
>> in changes, but mention that implicit permission can be sufficient in
>> certain cases. This fixes slight inconsistencies between Reported-by:
>> and Suggested-by: and makes the usage more intuitive.
>>
>> While at it, explicitly mention the dangers of our bugzilla instance, as
>> it makes it easy to forget that email addresses visible there are only
>> shown to logged-in users.
>>
>> The latter is not a theoretical issue, as one maintainer mentioned that
>> his employer received a EU GDPR (general data protection regulation)
>> complaint after exposing a email address used in bugzilla through a tag
>> in a patch description.
>>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Simona Vetter <simona.vetter@ffwll.ch>
>> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
>> ---
>> Note: this triggers a few checkpatch.pl complaints that are irrelevant
>> when when to comes to changes like this.
>>
>> v2:
>> - Retry differently. This slightly hardens the rule for Reported-by:
>>   while slightly lessening it for Suggested-by:. Those in the end are
>>   quite similar, so it does not make much sense to apply different ones.
>>   I considered using an approach along the lines of "if you reported it
>>   in pubic by mail, implicit permission to use in a tag is granted"; but
>>   I abstained from it, as I assume there are good reasons for the
>>   existing approach regarding Suggested-by:.
>> - CC all the people that provided feedback on the text changes in v1
>>
>> v1: https://lore.kernel.org/all/f5bc0639a20d6fac68062466d5e3dd0519588d08.1731486825.git.linux@leemhuis.info/
>> - initial version
>> ---
>>  Documentation/process/5.Posting.rst          | 17 ++++++--
>>  Documentation/process/submitting-patches.rst | 44 ++++++++++++++------
>>  2 files changed, 45 insertions(+), 16 deletions(-)
>>
>> diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
>> index dbb763a8de901d..b45c4f6d65ca95 100644
>> --- a/Documentation/process/5.Posting.rst
>> +++ b/Documentation/process/5.Posting.rst
>> @@ -268,10 +268,19 @@ The tags in common use are:
>>   - Cc: the named person received a copy of the patch and had the
>>     opportunity to comment on it.
>>  
>> -Be careful in the addition of tags to your patches, as only Cc: is appropriate
>> -for addition without the explicit permission of the person named; using
>> -Reported-by: is fine most of the time as well, but ask for permission if
>> -the bug was reported in private.
>> +Be careful in the addition of tags to your patches, as nearly all of them need
>> +explicit permission of the person named.
>> +
>> +The only exceptions are Cc:, Reported-by:, and Suggested-by:, as for them
> 
> I don't understand what you mean by "only exceptions" here.  Exceptions
> to what?

"Exception" to what is mentioned in the sentence before that and hinted
at with "nearly" there. Hmmm. Wondering if this is just not obvious
enough due to the newlines.

>> +implicit permission is sufficient under the following circumstances: when the
>> +person named according to the lore archives or the commit history regularly
>> +contributes to the Linux kernel using that name and email address -- and in
>> +case of Reported-by: and Suggested-by: did the reporting or suggestion in
>> +public. For all other situations explicit permission is required to among
>> +others prevent exposing email addresses considered private. Especially ask for
>> +permission when it comes to bug trackers, as most only show addresses to logged
>> +in users; that includes bugzilla.kernel.org, whose privacy policy explicitly
>> +states that 'your email address will never be displayed to logged out users'.
> 
> How about makeing this much simpler, basically "any public reference can
> be used, but please note, email addresses in bugzilla.kernel.org are not
> public.  Anything offered in private should probably not be referenced."
> or something like that?

Well, as hinted in the note for v2 above: I'm all for that and maybe I'm
just overly careful (aka a coward ;-) ) here -- but in the end did not
go that far due to the "Please note that this tag should not be added
without the reporter’s permission, especially if the idea was not posted
in a public forum." that's currently in submitting-patches, as there
might be reasons why it was written like that way (which sounds like
"public is not enough" to my ears).

Ciao, Thorsten

