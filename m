Return-Path: <linux-doc+bounces-1767-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF1A7E3208
	for <lists+linux-doc@lfdr.de>; Tue,  7 Nov 2023 01:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1EFBB20A8E
	for <lists+linux-doc@lfdr.de>; Tue,  7 Nov 2023 00:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C217FD;
	Tue,  7 Nov 2023 00:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5xFOTJl"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E63E633
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 00:10:14 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CDEEBB;
	Mon,  6 Nov 2023 16:10:14 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cc2fc281cdso38270525ad.0;
        Mon, 06 Nov 2023 16:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699315813; x=1699920613; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8eZ4f+HKE0Dret1qHPporvZn8dbeKhvVjY9m+eg4eA=;
        b=M5xFOTJlWBgV4FdrDwYMn2DPKL5Mwp9qeGKKwhS0UNgCStGEThbg6YRYwcQqskMBl3
         /aa4IriMS+b7t8GsZy8JdYZ3CY3Ex4S6pmzhW/9qu4xYOuZFNU2nYfylCsNgm9z48l2T
         f8977UpzobGGZo0jAojSS8zOlsTb5dPxgsEZsKS/TWDGM9QA/VQ/4k56k8OajmImzFKG
         eeAXD5fLIgmR10TbMLg/COEZ5JnQ/mUlqeifcvSdAXme5pj0vAQMVI/4OtMqEeZtnEDg
         GMY2Mr5V3YVNNfSOZnggGRW1tHwU9C3CUEA+zHf12f1PqciYPY/n1sfuwaZWyaCX+7Vl
         ufpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699315813; x=1699920613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n8eZ4f+HKE0Dret1qHPporvZn8dbeKhvVjY9m+eg4eA=;
        b=HgpALC45cJqCgZeIBw3vBGAIm0nfqr7LiNep8io4zo5vjXhK4psyzZcicmZhF8/jQa
         jF+9zjAnabHnTo/lubZnAnoHwxixCZIkO91igrwaGYD3ZnZd/UAqATHY5ocvPbhJygf8
         cn8or3/xcB6VwMzlcusxW9hY24ymaDKtryIxUiJT1DleKi4gk6WnYqWgnDjTEezV5F0j
         kZlCVKqTH+aN5xJYRtv0YTveQ9wvCFLTYGwN8bvEGWswKvXJTRlYxg4+PhGeBm5WNHAq
         R3HC9VMypXiqSiMaM7BUe9ppKHuMKxxLl0Gt9RYDugoyv/V8pNrYWQzAeO6kOndMVJSW
         J+3Q==
X-Gm-Message-State: AOJu0Yyk59saSqx41YCX0svAewfohORp65Il6QkOmbGGPeLR/3Tt9jiQ
	6EcNHTnt1W292D7bWDeyi8E=
X-Google-Smtp-Source: AGHT+IHrvLSKOdFW+GmkHNiYDqpZ6dXWWQRLcaGPmm9XNsTWQ7pgImbbpKjHA5FepORg8sPiLvZKKA==
X-Received: by 2002:a17:902:e30a:b0:1cc:644a:211b with SMTP id q10-20020a170902e30a00b001cc644a211bmr14076999plc.47.1699315813424;
        Mon, 06 Nov 2023 16:10:13 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902704300b001c613091aeasm6349072plt.297.2023.11.06.16.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 16:10:12 -0800 (PST)
Message-ID: <5282cf04-eae4-4170-a833-cf4c4495a943@gmail.com>
Date: Tue, 7 Nov 2023 07:10:01 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs: gpu: rfc: i915_scheduler.rst remove unused
 directives for namespacing
To: Jani Nikula <jani.nikula@intel.com>,
 Hunter Chasens <hunter.chasens18@ncf.edu>, corbet@lwn.net,
 Luca Coelho <luciano.coelho@intel.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20231104134708.69432-1-hunter.chasens18@ncf.edu>
 <ZUhvj2uj_PvaDxIM@debian.me> <8734xj18ck.fsf@intel.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <8734xj18ck.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2023 17:31, Jani Nikula wrote:
> On Mon, 06 Nov 2023, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>> On Sat, Nov 04, 2023 at 09:47:08AM -0400, Hunter Chasens wrote:
>>> diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
>>> index c237ebc024cd..23ba7006929b 100644
>>> --- a/Documentation/gpu/rfc/i915_scheduler.rst
>>> +++ b/Documentation/gpu/rfc/i915_scheduler.rst
>>> @@ -135,13 +135,9 @@ Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
>>>  drm_i915_context_engines_parallel_submit to the uAPI to implement this
>>>  extension.
>>>  
>>> -.. c:namespace-push:: rfc
>>> -
>>>  .. kernel-doc:: include/uapi/drm/i915_drm.h
>>>          :functions: i915_context_engines_parallel_submit
>>>  
>>> -.. c:namespace-pop::
>>> -
> 
> What makes the namespacing unnecessary?
> 
> $ git grep '.. kernel-doc:: include/uapi/drm/i915_drm.h'
> Documentation/gpu/driver-uapi.rst:.. kernel-doc:: include/uapi/drm/i915_drm.h
> Documentation/gpu/rfc/i915_scheduler.rst:.. kernel-doc:: include/uapi/drm/i915_drm.h
> 
> And you get [1] and [2].
> 
>>>  Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
>>>  -------------------------------------------------------------------
>>>  Contexts that have been configured with the 'set_parallel' extension can only
>>
>> The warnings go away, thanks!
> 
> What warnings go away?
> 

Oops, I mean the patch author had silenced these warnings.

-- 
An old man doll... just what I always wanted! - Clara


