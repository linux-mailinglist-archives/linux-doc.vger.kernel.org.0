Return-Path: <linux-doc+bounces-37026-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D79A29333
	for <lists+linux-doc@lfdr.de>; Wed,  5 Feb 2025 16:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F5BE18901D0
	for <lists+linux-doc@lfdr.de>; Wed,  5 Feb 2025 15:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DBA18A6BD;
	Wed,  5 Feb 2025 14:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDps20Qu"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D901DF59;
	Wed,  5 Feb 2025 14:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738767446; cv=none; b=s+3xV4udW7R93308klcbSnMovuA+t4/COL502257dtbzXWIWjU2fEkjVgkmXSYPMn/d8aFu2j6Cx8UKczSGfZalJHNhwl29fFhcPF43jFnjl2qxr3Aa0IMHhzfGu7u+wlFzgT5p3hz9emzGRQzCn+XFckS90/QQXAnb8ZM/by2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738767446; c=relaxed/simple;
	bh=JgOlrUGCcq47WGQbjBNjkYEeg1SHp+TKcTomMuCBNQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NWFGSrafNy4XhTQt/8OlTBrPT4SpdqS7C83FXk2wWKVKeWa0UU02dYuixAQ9xVRQngtgfeHwudG/UTGdk9Pzv5LG5LoLGamfb5HNRijgrXnPv8sXnpC8S8nrvIA3FpZTLQK3xmUFXE3merhgCt95s+Z9tkRPdRm3aSFU0E1F+jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDps20Qu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA343C4CED1;
	Wed,  5 Feb 2025 14:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738767445;
	bh=JgOlrUGCcq47WGQbjBNjkYEeg1SHp+TKcTomMuCBNQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NDps20QuCCCaQH5tlVig0upfqZtHnDIVnwydnl2MhTxqF7XjkKegZwgS5i2RUuOeu
	 HiBKVcZTjAhFHYfNoH4OeTZQJqTwLK96Z+PZlpwRsifzDe7+TNcTWKuBgUy8iNRg96
	 5YeqKXOyPr062NCYHVJtiQJtsBAKRods0taqC76zHecQalVGj35W53Zc7MDHG6B9KP
	 jvbtvYIhiCz8vcDXbjVYm267J00cBGbuy3ZUmNI0WmWAlvIxYG4kXQUCDR9EEd1rub
	 hh74Yh0g3gSXW8BXhzF+aGKfjpsbA37e41js24jzMq+5hSw3GebNA9jm/feO/0MQWe
	 NiostllONuaPQ==
Message-ID: <65c2c9d3-e173-4475-a58e-168aa087b889@kernel.org>
Date: Wed, 5 Feb 2025 15:57:21 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: submitting-patches: document the format for
 affiliation
To: Yanteng Si <si.yanteng@linux.dev>, Jakub Kicinski <kuba@kernel.org>,
 corbet@lwn.net
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250203174626.1131225-1-kuba@kernel.org>
 <0b68e534-df14-4496-802a-bc0437469720@linux.dev>
 <d3cdc752-fd61-41cc-a76c-7848d27a6802@kernel.org>
 <64202cd3-fe83-41af-a9de-ec6eef5f4c21@linux.dev>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <64202cd3-fe83-41af-a9de-ec6eef5f4c21@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/02/2025 15:52, Yanteng Si wrote:
> 
> 在 2/5/25 22:23, Krzysztof Kozlowski 写道:
>> On 05/02/2025 08:37, Yanteng Si wrote:
>>>
>>>
>>> 在 2025/2/4 01:46, Jakub Kicinski 写道:
>>>> Adding company name in round brackets to From/SoB lines
>>>> is fairly common, but I don't see it documented anywhere.
>>>> Every now and then people try to add the sponsorship lines
>>>> to the commit message, fun example from this merge window:
>>>>
>>>>     Sponsored by:   The FreeBSD Foundation
>>>>
>>>> from commit 2ce67f8bf1ce ("wifi: iwlwifi: mvm: fix iwl_ssid_exist()
>>>> check"). Better format would be:
>>>>
>>>>     Author: Miri Korenblit (FreeBSD Foundation) <...
>>>>
>>>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>>>> ---
>>>> CC: corbet@lwn.net
>>>> CC: workflows@vger.kernel.org
>>>> CC: linux-doc@vger.kernel.org
>>>> ---
>>>>    Documentation/process/submitting-patches.rst | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
>>>> index 8fdc0ef3e604..12ed28b3d113 100644
>>>> --- a/Documentation/process/submitting-patches.rst
>>>> +++ b/Documentation/process/submitting-patches.rst
>>>> @@ -717,6 +717,12 @@ patch in the permanent changelog.  If the ``from`` line is missing,
>>>>    then the ``From:`` line from the email header will be used to determine
>>>>    the patch author in the changelog.
>>>>    
>>>> +The author may indicate their affiliation or the sponsor of the work
>>>> +by adding the name of an organization to the ``from`` and ``SoB`` lines,
>>>> +e.g.:
>>>> +
>>>> +	From: Patch Author (Company) <author@example.com>
>>>> +
>>> It looks great, but I'm a bit worried that it could be misused,
>>> which might cause trouble for some companies. Even without
>>> this patch, there's no way to prevent the misuse.
>>> Consider the following situation:
>>>
>>> From: Yanteng Si (linux foundation) <si.yanteng@linux.dev>
>>>
>>> Obviously, I'm not a member of the Linux Foundation.
>>
>> Nothing stops you from doing this now, because mentioned format is
>> already accepted.
>>
>>> This might seem a bit absurd, but I think it could actually happen,
>>> especially with some driver code. Hardware manufacturers would
>>> prefer to upstream their code under the guidance of their companies,
>>> considering subsequent hardware iterations. However, if some
>>> enthusiasts pretend to be company employees, and the maintainer,
>>> trusting the tag, actively applies the patches, it could disrupt the
>>> rhythm of the hardware manufacturers and is not conducive to code
>>> maintenance in the long run.
>>
>> We trust people, not companies, so I think it does not matter for the
>> trust what is written in ().
>>
>>
>>> How about we add one more part: The organization name in
>>> the parentheses doesn't necessarily represent the developer's
>>> relationship with that organization, especially when it doesn't
>>> match the email domain name. Maintainers should be cautious
>>> and verify carefully before applying patches.
>> Sorry, but how? First, maintainers have already a lot on their plate and
>> you want to ask them to do some more checks? And how would these checks
>> look like? Shall I ask people to give me certificates of employement or
>> their contracts?
> 
> That's not necessary. Just ignore the content inside the parentheses
> 
> during the review. This will instead reduce the workload of the maintainers.
Hm? You said submitting patches document should instruct maintainers to
"verify carefully". Verify what?

We all ignore the content inside the parentheses, because it is not
relevant to the code. I don't understand what sort of problem you want
to solve with proposed text.

Best regards,
Krzysztof

