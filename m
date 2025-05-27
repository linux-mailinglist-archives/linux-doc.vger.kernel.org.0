Return-Path: <linux-doc+bounces-47543-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEACAC4621
	for <lists+linux-doc@lfdr.de>; Tue, 27 May 2025 04:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 113F51748DF
	for <lists+linux-doc@lfdr.de>; Tue, 27 May 2025 02:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD76E15E5DC;
	Tue, 27 May 2025 02:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a+FoRMfv"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103DD3C465
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 02:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748312136; cv=none; b=JIRA8IffMaFn1+45eKwdyOzKPIwjTmH+jrDzUfkn1i5rJTMbhHtmxISxSfW3s1t0ppkNEHZ2oiNqGa0hKu1+aTXcMPk///fFt1CEpTdmxfuQXgZc22iWJCco88xS2F83BbjQ/i+zzzoCgNeBeHNGzXUcZZPPpo5wqdzx32WdBS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748312136; c=relaxed/simple;
	bh=gy+iSnN6BujU+OyUD34gHbKI/Tlhhz3bicJScmZmV4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pclq39K4hZXQu7GFqT8XbNn5YJrSYH1cfwZwOu8Vvp+zW/pggmvhgDS+Asbj/WOaLw8KMl7T1gGIgdsM7vzmeLtEKzI0E3tBRTn1HCmkbh9Wyydr4Thh7R0xB4p+AjO4iRxeVzE8/pitQYnbR1jie6AikWAGGip23K48FxO5XQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a+FoRMfv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748312131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AqRgYOufLjDdRZWStx7NgUNbciHlTK6MFqY+ZAN1g3w=;
	b=a+FoRMfvWKfAw8P95KLsikvCDeRnbjEMT4IVCJt4aO4FYInBHCGHDL/p6s79682lAleeDz
	i9TC1YXCxMvAH4YMpxlmurSLubmEje9tyHWwf8VSRtYdJlsK/aG9A/JDdtOhioS1HcOjm+
	TqMr8YzoOd/BQYtzad4krgAQDOzfii4=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-gzS7MMjROdCY4WUriHrBSQ-1; Mon, 26 May 2025 22:15:29 -0400
X-MC-Unique: gzS7MMjROdCY4WUriHrBSQ-1
X-Mimecast-MFC-AGG-ID: gzS7MMjROdCY4WUriHrBSQ_1748312128
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b115fb801bcso3337756a12.3
        for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 19:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748312128; x=1748916928;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AqRgYOufLjDdRZWStx7NgUNbciHlTK6MFqY+ZAN1g3w=;
        b=pAS1qB7LzGupb4q4fd7K/caGsAZhpCeTz1EnaasQZByEX14AM85Vul96lMTBt5ofuE
         bxwvdCU6hs2p0EDEWRtJcC46tvthsYx709PyZ4lVOoCpqxBI1bGy0JZHdUOurHzWNNdj
         XU9lOKIJ+JPnjKNrStd1HyyPyN0g0h1qWcC2qKyW2hUvvNOKNkJyGJ8CEuthvErksm5U
         m1FGvKyUHS8hWiMVV6Gal5CVjHd4OyO74pe0oSTO+mqOO3qDdSHW7YtWM5arbe5DNxwL
         a8n0vXACJP1I59HvAVgK5qT1qFciOTGuEe6C7Fp0sLi+ydD4Sro70rOdY+lG5wrhirQq
         4f1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMFh/7wnn5b2VYAIIBsFAN1V4Qg4MYtV/18V98JyLqRT3Uw+N/s7NtkLsNJUgpapxri4mM4RtsrJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+igFb05a6ngE7sPEdd4uaA5/VuBJEj7NGi7E7iWF/UzHpMsqx
	JzCk6JSyUcjBxVzTQj4SZxyYNkzwV9ayja9jTcWGaQEJjyVgvCD81727r/gx/x4MuAN11eYAVQ9
	GkqRYBSvdzZ3KHM1G7/WaJDXLIFHJxXa4zziQQEK9VZfokgJ/1l24gPHxKqVTdw==
X-Gm-Gg: ASbGncsDLO3JoLAQn6aCkzFpUFRtGrJjavgOJRsCef02u1rOdLy4LTLDLc3SrS2wxMW
	kMySZL+t+lqEsayOfV3mOKc7qxFjFXh7EVx5A9XM2X52+CDzP1XoNIuAw72Rbuc3KX7wS+V/AvG
	80a8z0EV/EMOjxSpUlEl8xAUMz6fN5YgqJXFF2xOQzpqx5Ua/fjtxCurikRBwDWENlAf6FqZvi3
	gDKuRTeIySOjnzpl9FcAch22JiEIr3Fep+k+zqtz0+Bej8YGbcvx2hpDb1mzYsmh8oUwqe7DD1V
	6Lqwao9pfG0SLT034g==
X-Received: by 2002:a05:6a20:6a27:b0:1f5:87dc:a315 with SMTP id adf61e73a8af0-2188c248679mr18075190637.12.1748312128440;
        Mon, 26 May 2025 19:15:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZtFbzmoFlt/XhE3Pxh8zcJdcRCqZVAb26w0MA+nQY12h9skjxs6x3NA1DvJXIdMKSt04fMA==
X-Received: by 2002:a05:6a20:6a27:b0:1f5:87dc:a315 with SMTP id adf61e73a8af0-2188c248679mr18075153637.12.1748312128057;
        Mon, 26 May 2025 19:15:28 -0700 (PDT)
Received: from [10.72.120.5] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf8db5csm17773423a12.34.2025.05.26.19.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 19:15:27 -0700 (PDT)
Message-ID: <560ae765-3fa1-42b7-a71c-e078e52e64fd@redhat.com>
Date: Tue, 27 May 2025 10:15:20 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/23] md/md-bitmap: delay registration of bitmap_ops
 until creating bitmap
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@lst.de, colyli@kernel.org, song@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 johnny.chenyi@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20250524061320.370630-1-yukuai1@huaweicloud.com>
 <20250524061320.370630-8-yukuai1@huaweicloud.com>
 <CALTww2_03_fVt+KMcmtbGw-kcRsLLpAG7W62e3y0W9SpvhUVtg@mail.gmail.com>
 <12a61dcf-ad39-48e8-132f-c49979b9012b@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
In-Reply-To: <12a61dcf-ad39-48e8-132f-c49979b9012b@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2025/5/26 下午3:57, Yu Kuai 写道:
> Hi,
>
> 在 2025/05/26 14:52, Xiao Ni 写道:
>> On Sat, May 24, 2025 at 2:18 PM Yu Kuai <yukuai1@huaweicloud.com> wrote:
>>>
>>> From: Yu Kuai <yukuai3@huawei.com>
>>>
>>> Currently bitmap_ops is registered while allocating mddev, this is fine
>>> when there is only one bitmap_ops, however, after introduing a new
>>> bitmap_ops, user space need a time window to choose which bitmap_ops to
>>> use while creating new array.
>>
>> Could you give more explanation about what the time window is? Is it
>> between setting llbitmap by bitmap_type and md_bitmap_create?
>
> The window after this patch is that user can write the new sysfs after
> allocating mddev, and before running the array.


Thanks for the explanation. Is it ok to add it in the commit log message?

>>
>>>
>>> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
>>> ---
>>>   drivers/md/md.c | 86 
>>> +++++++++++++++++++++++++++++++------------------
>>>   1 file changed, 55 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/drivers/md/md.c b/drivers/md/md.c
>>> index 4eb0c6effd5b..dc4b85f30e13 100644
>>> --- a/drivers/md/md.c
>>> +++ b/drivers/md/md.c
>>> @@ -674,39 +674,50 @@ static void no_op(struct percpu_ref *r) {}
>>>
>>>   static bool mddev_set_bitmap_ops(struct mddev *mddev)
>>>   {
>>> +       struct bitmap_operations *old = mddev->bitmap_ops;
>>> +       struct md_submodule_head *head;
>>> +
>>> +       if (mddev->bitmap_id == ID_BITMAP_NONE ||
>>> +           (old && old->head.id == mddev->bitmap_id))
>>> +               return true;
>>> +
>>>          xa_lock(&md_submodule);
>>> -       mddev->bitmap_ops = xa_load(&md_submodule, mddev->bitmap_id);
>>> +       head = xa_load(&md_submodule, mddev->bitmap_id);
>>>          xa_unlock(&md_submodule);
>>>
>>> -       if (!mddev->bitmap_ops) {
>>> -               pr_warn_once("md: can't find bitmap id %d\n", 
>>> mddev->bitmap_id);
>>> +       if (WARN_ON_ONCE(!head || head->type != MD_BITMAP)) {
>>> +               pr_err("md: can't find bitmap id %d\n", 
>>> mddev->bitmap_id);
>>>                  return false;
>>>          }
>>>
>>> +       if (old && old->group)
>>> +               sysfs_remove_group(&mddev->kobj, old->group);
>>
>> I think you're handling a competition problem here. But I don't know
>> how the old/old->group is already created when creating an array.
>> Could you explain this?
>
> It's not possible now, this is because I think we want to be able to
> switch existing array with old bitmap to new bitmap.


Can we add the check of old when we really want it?

Regards

Xiao

>
> Thanks,
> Kuai
>
>>
>> Regards
>> Xiao
>


