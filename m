Return-Path: <linux-doc+bounces-30012-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A64819BDD55
	for <lists+linux-doc@lfdr.de>; Wed,  6 Nov 2024 03:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 109E4B217CB
	for <lists+linux-doc@lfdr.de>; Wed,  6 Nov 2024 02:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D25E18FC8C;
	Wed,  6 Nov 2024 02:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="cDQKclOx"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5900E18A922
	for <linux-doc@vger.kernel.org>; Wed,  6 Nov 2024 02:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730861800; cv=none; b=hG+tn+lvWsMPcxzp44p+fpOLDJr33X8i65beC3MWh9rFdigJb2uVqAmcx4mOtqjTaRTsacVZOfXfUDGNCfjKhVsOoLHgxmgTadO2zK0eitNO1RRWrdcwx/mRua5VMUjIzYlw9UY+9tMO8SjUU/Cxe8SY1Y+7N3TFcZYrO1zNUQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730861800; c=relaxed/simple;
	bh=v7EMBM5wtdNiLlk/MSFZIFIKgzmDktDMJeqDXyO8rfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tdx90KilBEbxWUEZQr+1AixZsZQoYHoyAnLJf720wnmZMDucrBgA1HnYvVqmN3/HLq7aRGVGt4iTfJZ4oKxRO0X7NlEaS9QxALrT7AgmQwin4Rmp/BbZe1+jlZlu2KvotDvyMY63sUqngUwpyW4kahGTUb9L6xTHN7rcOMAQObE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=cDQKclOx; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e2ad9825a7so4523566a91.0
        for <linux-doc@vger.kernel.org>; Tue, 05 Nov 2024 18:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1730861798; x=1731466598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M6v8RHSDXZgHsuLc1Cv4dDOGwWTdVAAFVIsGb+m4CYc=;
        b=cDQKclOxwfg/v3zFze9wv1ocPK2gpkac00AEaJ6LIf9pJ8xlDFQ50OELzHaM+5LGwd
         g27ZGzIGQgEihpCJtoaiVSez0YDlyTTyQPI73pNouUPHa5XjS1ut9BpA16uFveS3oRLR
         1XwAtobZ+k5P1DBuJcz59MEcdCzRuWKPNvdFsRrd8oDD6d9VPs3dfIk7OXMwpKWCW4Lq
         FtAaHbzo4TUU1Kuamga+Ba1ad5Yfh25rl24UJlLBypwkm/RDseBqdbpaxWlnib5biqm0
         Jps8YyvZF24BuZksuNt+uwMeE6ogeFXXYG/sLfnp6T0ES3D14hEq3AXgEena3hb6bbxE
         XghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730861798; x=1731466598;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M6v8RHSDXZgHsuLc1Cv4dDOGwWTdVAAFVIsGb+m4CYc=;
        b=MPEd/IaDUJAFyGfNrhlyTQFKfB5xjnpu9/Y1CBHK4yqrGc/mLsFR7xhN5u6ztf9dPh
         EgDzhiqScwFaPDYVxCT5xmnTGzyMhP/WqZXRdumqkJsl9xDauv+lh42PBNex9S9sqsqK
         PqTL2GY9TQoLG6jefecvqheEaiJnzyfOUhBFoD2K6zyEH/YBIAV97e++81hWgjrRI/qT
         mh+ebYj4rs7Wx7aqlV4e4PFbDQ/ZTqvjQQPVzTSQJpbz+3KU4R8+LuyZXyvfC2gjF/L0
         kDHm3tN6KQdQZqf1cXm1uENZwYyd+wBSbKCfu4/XmlTpfpXRj/ETqz/CelLfRFgMYnt5
         9UAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXurgyYYNS1BWKFIGWkhA3+0FbySXA120+c/0Cyap96dAxHkOS5JeDaoE+V1vUwOLijEO1G15uaZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSKoCv3qTPJsBF9JXoem6jOKJLvF5FF5JrqcsRA+czeT5Qhiyi
	v9ROWZAPhhtJ/01ig+JcLpsPSyb0QuwFUzr1q5b9LE4JdJoDBjkUvlNignCv9/w=
X-Google-Smtp-Source: AGHT+IHIE44rAIMR6CmM88Kutnzf0JaYRrQsw3mD4TNQQAzGQub8JUfRY9RzhGAHTVMgGodOek2h5Q==
X-Received: by 2002:a17:90a:2ca7:b0:2e2:c15f:1ffd with SMTP id 98e67ed59e1d1-2e8f1071bdbmr39545597a91.14.1730861797615;
        Tue, 05 Nov 2024 18:56:37 -0800 (PST)
Received: from [10.84.149.95] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a541e16sm302276a91.21.2024.11.05.18.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 18:56:37 -0800 (PST)
Message-ID: <5969f498-a515-4394-a2b6-5d3abe2872aa@bytedance.com>
Date: Wed, 6 Nov 2024 10:56:29 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] docs/mm: add VMA locks documentation
Content-Language: en-US
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Jann Horn <jannh@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Alice Ryhl <aliceryhl@google.com>,
 Boqun Feng <boqun.feng@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <20241101185033.131880-1-lorenzo.stoakes@oracle.com>
 <CAG48ez0qsAM-dkOUDetmNBSK4typ5t_FvMvtGiB7wQsP-G1jVg@mail.gmail.com>
 <2bf6329e-eb3b-4c5e-bd3a-b519eefffd63@lucifer.local>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <2bf6329e-eb3b-4c5e-bd3a-b519eefffd63@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/11/5 00:42, Lorenzo Stoakes wrote:
> On Sat, Nov 02, 2024 at 02:45:35AM +0100, Jann Horn wrote:
>> On Fri, Nov 1, 2024 at 7:50 PM Lorenzo Stoakes

[...]

>>> +
>>> +Page table locks
>>> +----------------

Many thanks to Lorenzo for documenting page table locks! This is really
needed. And at a glance, I agree with Jann's additions.

>>
>> (except last-level page tables: khugepaged already deletes those for
>> file mappings without using the mmap lock at all in
>> retract_page_tables(), and there is a pending series that will do the
>> same with page tables in other VMAs too, see
>> <https://lore.kernel.org/all/cover.1729157502.git.zhengqi.arch@bytedance.com/>)

Thanks to Jann for mentioning this series, I just updated it to v2
recently:

https://lore.kernel.org/lkml/cover.1730360798.git.zhengqi.arch@bytedance.com/

> 
> Ugh wut OK haha. Will look into this.

Thanks!


