Return-Path: <linux-doc+bounces-16595-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC848C9EB4
	for <lists+linux-doc@lfdr.de>; Mon, 20 May 2024 16:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F4B6B22F5F
	for <lists+linux-doc@lfdr.de>; Mon, 20 May 2024 14:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CAE136652;
	Mon, 20 May 2024 14:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuuH80fa"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB715337F;
	Mon, 20 May 2024 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716214970; cv=none; b=iobF8cT/tMJR9sxnpEYEjC5xxxYAOY2mYATWHmd9lNVGhb5qdq2hyVPMmDF/ieb0hTRYrLt7vcbEtG/qRBLzNROUV703GKILYLnlbN7DUuFY+1xRx+w2aqWtzHZgfHcQg8XoU2zfiOi2KCCWNUq412XZuP1PDkoNqkZTeDNmg+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716214970; c=relaxed/simple;
	bh=lfTjsNqw5TQqBRgjrksLNUzWi4N2HBhLrqBEDXvv2SM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8/P9/tefzetu6U18uVB5LLxKSeuAD+z6bfm0cNDSm8tLayNN7ULvp2jTt0AZAdhEVfKN+QCsN2otfcMz7qYqbORZ4bFl5Qa6zWDK08avZqudjk882VljVouz1jQ0Jf5lsEdgPTltzWzvDLttOpIbsxc6voRdKbxI3oQAAmWfHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TuuH80fa; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6f5053dc057so1309901b3a.2;
        Mon, 20 May 2024 07:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716214968; x=1716819768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KnyB+QuDgcekYCP38DxOveF/NkYkcxkyK9rpYTfrpow=;
        b=TuuH80faGbDpcgBXZyQodUV+i0tydKnH+YzsSjKnwop0E2A/OujtRNSaWC5bGfbiGD
         bdMKxd+UbIMsIby9qRxucHbjyhBaZA6sTdX468UGzxsrrrQkgEiraj93RskEOW9Cy8dX
         4swQuvQ5s4MrHSI27Z6eUGT/dMy8rkdewA80BPS1Y5qoZRb+Fmhm6brOb9niy3U4xcAl
         H85Vui4L9VfsiRXG82e67VjXQ+Cri0xpzSHqAmPi1/adtVvbttdQ/9VewBkuK8KyR6yA
         G7hmOSUXLSjgcpKvd3BviHtOWgBBl1oBBIp06QCWPWp+Ny3QI+y9E8VzfZuKiuR5rCRb
         FukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716214968; x=1716819768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KnyB+QuDgcekYCP38DxOveF/NkYkcxkyK9rpYTfrpow=;
        b=POW/HNEZCxf0opiyW4+A5xSo65pSRkYVZ41rwXBpDJe7vvNOWobIEv4hO1gfS1AVbW
         Sm212cxGzT9sPDpSrAiGHG6miGeUXG6rYDndNH8qhRlm6fFKe7x9Oni90hutuGZI1VCj
         9jMn6jUPj8BGl+uqFsJeJydOEpd4ydBGrBjQgAduYI6XTbXEuoe4g89dsLTTDayQSQJ/
         DfAZz8bn9+3ssiOfN4KiM2Yxb8np1vOPygKYAY1RCLoQ7/NJlBRoiJ7P3yfGcUnGoh1T
         T1d9afShkkEuf1gNQAOvu7yHyHDa+buy3oCT4/tBfd3wQEavxLURvzD1PT6/a5gNuV+/
         1Kxg==
X-Forwarded-Encrypted: i=1; AJvYcCUqyEi/4T4vDS5VWP1Wpwwisvgswkz1Phv6Rl8aeHPnRttaIf7gbouKoY5eKwWPlaNwKcquZ1b4fuitmBHtR2+YIz+OBzOK3NFVzRQl2vFtXzgQHhgc4HbbGoDpr5fA68ab/O7xRObLtKyn+t5LX4KzFLcWM1/FoF+m2HTEkgw9lZXz
X-Gm-Message-State: AOJu0YybETs583onqO0Bmybj9OajLcVR9D2Kh70s/ZTFLg74Q8ZLOWtN
	cnwmzK1zEvE8Z/fjQLvkyylx3Vc4u77cJUyqPsq6gXAMjZx0+eaL
X-Google-Smtp-Source: AGHT+IF/6gZqu432H7xbcxsFk472HWtVgsljgcWheAUkPuK+Yse85VI0EYlsMN3s13qmJ4Zs0eRW/A==
X-Received: by 2002:a05:6a00:1941:b0:6ed:def7:6ae2 with SMTP id d2e1a72fcca58-6f4e02981e9mr32320689b3a.6.1716214967619;
        Mon, 20 May 2024 07:22:47 -0700 (PDT)
Received: from [192.168.50.95] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66585sm19755579b3a.10.2024.05.20.07.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 07:22:46 -0700 (PDT)
Message-ID: <57f0d90c-4cc6-4418-ab79-6ae026d8ae09@gmail.com>
Date: Mon, 20 May 2024 23:22:42 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: cve Korean translation
To: Jinwoo Park <pmnxis@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Austin Kim <austindh.kim@gmail.com>, shjy180909@gmail.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240511195942.30857-1-yskelg@gmail.com>
 <fcbaeb18-41ce-47c2-8914-96345449a280@gmail.com>
Content-Language: en-US
From: Yunseong Kim <yskelg@gmail.com>
In-Reply-To: <fcbaeb18-41ce-47c2-8914-96345449a280@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/20/24 10:58 오후, Jinwoo Park wrote:
> On 2024. 5. 12. 오전 4:59, yskelg@gmail.com wrote:
>> From: Yunseong Kim <yskelg@gmail.com>
>>
>> This is a Documentation/process/cve korean version.
>>
>> Signed-off-by: Yunseong Kim <yskelg@gmail.com>
> 
> Thanks for translating new Documentation/process/cve document to Korean
> Language. Most of the Korean sentences are looks good to me. But only
> one sentence seemed unnatural.

Thank you for the review Jinwoo.

>> 잘못된 CVE 항목들
>> =================
>>
>> -해당 배포판에서 변경된 사항으로 인해 또는 해당 배포판이 더 이상
>> kernel.org
>> +특정 배포판에서 변경된 사항으로 인해 또는 해당 배포판이 더 이상
>> kernel.org
>> 지원 릴리스가 아닌 커널 버전을 지원하기 때문에 Linux 배포판에서만 지원되는
>> Linux 커널에서 보안 문제가 발견되는 경우 Linux 커널 CVE 팀에서 CVE를 할당할
>> 수 없으며 해당 Linux 배포판 자체에서 요청해야 합니다.
> 
> When the first modifier "해당" is first used in a Korean sentence, like
> "the", there needs to be an explanation of what it is targeting.


You're right, that phrase was awkward in the direct translation. Thanks
for catching that.

> However, in the process of literal translation, it seems that "the"
> became "해당" due to the difference in word order between Korean and
> English, And since the translated sentence did not describe which "Linux
> distributor" is being described, it would be very difficult if
> "특정(specific)" were used instead. It seems natural.

I will send version 2 patch. Thank you!

Warm Regards,

Yunseong Kim


>> ---
>>  .../translations/ko_KR/process/cve.rst        | 107 ++++++++++++++++++
>>  1 file changed, 107 insertions(+)
>>  create mode 100644 Documentation/translations/ko_KR/process/cve.rst
>>
>> diff --git a/Documentation/translations/ko_KR/process/cve.rst b/Documentation/translations/ko_KR/process/cve.rst
>> new file mode 100644
>> index 000000000000..26682969b2b7
>> --- /dev/null
>> +++ b/Documentation/translations/ko_KR/process/cve.rst
>> @@ -0,0 +1,107 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +:Original: Documentation/process/cve.rst
>> +:Translator: Yunseong Kim <yskelg@gmail.com>
>> +
>> +==========
>> +CVE 항목들
>> +==========
>> +
>> +공통 취약점 및 노출(CVE®) 번호는 공개적으로 발표된 보안 취약점을 식별, 정의 및
>> +목록화하기 위한 명확한 방법으로 개발되었습니다. 시간이 지남에 따라 커널
>> +프로젝트와 관련하여서는 그 유용성이 감소했으며, CVE 번호는 부적절한 방식과
>> +부적절한 이유로 할당되는 경우가 매우 많았습니다. 이로 인하여 커널 개발
>> +커뮤니티에서는 이를 기피하는 경향이 있었습니다. 그러나 커널 커뮤니티 외부의
>> +개인과 회사가 CVE 및 기타 형태의 보안 식별자를 할당하라는 지속적인 압박과
>> +지속적인 남용이 결합되면서 커널 커뮤니티가 이러한 할당에 대한 통제권을 가져야
>> +한다는 것이 분명해졌습니다.
>> +
>> +Linux 커널 개발자 팀은 잠재적인 Linux 커널 보안 문제에 대해 CVE를 할당할 수
>> +있는 권한이 있습니다. 여기서 할당은 :doc:`일반 Linux 커널 보안 버그 보고
>> +절차<../process/security-bugs>`와는 별개입니다.
>> +
>> +Linux 커널에 할당된 모든 CVE 목록은
>> +https://lore.kernel.org/linux-cve-announce/ 에 있는 Linux-CVE 메일링 리스트의
>> +아카이브에서 확인할 수 있습니다. 할당된 CVE에 대한 알림을 받으려면 해당
>> +메일링 리스트에 `구독
>> +<https://subspace.kernel.org/subscribing.html>`_ 하세요.
>> +
>> +절차
>> +====
>> +
>> +일반적인 안정 릴리스 절차의 일부로, 잠재적으로 보안 문제가 될 수 있는 커널
>> +변경 사항은 CVE 번호 할당을 담당하는 개발자가 식별하여 CVE 번호를 자동으로
>> +할당합니다. 이러한 할당은 linux-cve-announce 메일링 리스트에 공지사항으로
>> +수시로 게시됩니다.
>> +
>> +리눅스 커널이 시스템에 있는 계층으로 인해 거의 모든 버그가 커널의 보안을
>> +손상시키는 데 악용될 수 있지만 버그가 수정되면 악용 가능성이 명확하게 드러나지
>> +않는 경우가 많습니다. 이 때문에 CVE 할당 팀은 지나치게 조심스럽게 버그 수정이
>> +확인되는 모든 버그에 CVE 번호를 할당합니다.
>> +이것이 리눅스 커널 팀에서 발행하는 겉으로 보기에 많은 수의 CVE를 설명합니다.
>> +
>> +사용자가 CVE를 지정해야 한다고 생각하는 특정 수정 사항을 CVE 할당 팀이 놓친
>> +경우 <cve@kernel.org>로 이메일을 보내 주시면 해당 팀에서 함께 작업할 것입니다.
>> +이 별칭은 이미 릴리스된 커널 트리에 있는 수정 사항에 대한 CVE 할당 전용이므로
>> +잠재적인 보안 문제는 이 별칭으로 보내서는 안 됩니다.
>> +수정되지 않은 보안 문제를 발견했다고 생각되면 :doc:`일반 Linux 커널 보안
>> +버그 보고 절차<../process/security-bugs>`를 따르세요.
>> +
>> +Linux 커널에서 수정되지 않은 보안 이슈에 대해서는 CVE가 자동으로 할당되지
>> +않으며, 수정이 제공되고 안정적인 커널 트리에 적용된 후에만 자동으로 할당되며,
>> +기존 수정의 git 커밋 ID로 추적할 수 있습니다. 커밋으로 문제가 해결되기 전에
>> +CVE를 할당받고자 하는 사람은 커널 CVE 할당 팀<cve@kernel.org>에 문의하여
>> +예약된 식별자 항목들에서 식별자를 할당받으시기 바랍니다.
>> +
>> +현재 Stable/LTS 커널 팀에서 적극적으로 지원하지 않는 커널 버전에서 발견된
>> +문제에 대해서는 CVE가 할당되지 않습니다.
>> +현재 지원되는 커널 브랜치 목록은 https://kernel.org/releases.html 에서 확인할
>> +수 있습니다.
>> +
>> +할당된 CVE 항목들의 분쟁
>> +=========================
>> +
>> +특정 커널 변경에 대해 할당된 CVE에 대해 이의를 제기하거나 수정할 권한은
>> +전적으로 영향을 받는 관련 하위 시스템의 유지 관리자에게 있습니다.
>> +이 원칙은 취약점 보고에 있어 높은 수준의 정확성과 책임성을 보장합니다.
>> +하위 시스템에 대한 깊은 전문 지식과 친밀한 지식을 갖춘 사람만이 보고된
>> +취약점의 유효성과 범위를 효과적으로 평가하고 적절한 CVE 지정을 결정할 수
>> +있습니다. 이 지정된 기관 외부에서 CVE를 수정하거나 이의를 제기하려는 시도는
>> +혼란, 부정확한 보고, 궁극적으로 시스템 손상으로 이어질 수 있습니다.
>> +
>> +잘못된 CVE 항목들
>> +=================
>> +
>> +해당 배포판에서 변경된 사항으로 인해 또는 해당 배포판이 더 이상 kernel.org
>> +지원 릴리스가 아닌 커널 버전을 지원하기 때문에 Linux 배포판에서만 지원되는
>> +Linux 커널에서 보안 문제가 발견되는 경우 Linux 커널 CVE 팀에서 CVE를 할당할 수
>> +없으며 해당 Linux 배포판 자체에서 요청해야 합니다.
>> +
>> +커널 할당 CVE 팀이 아닌 다른 그룹에서 적극적으로 지원되는 커널 버전에 대해
>> +Linux 커널에 대해 할당된 CVE는 유효한 CVE로 취급해서는 안 됩니다.
>> +CNA 수정 절차를 통해 해당 항목을 무효화할 수 있도록 커널 CVE 할당 팀에
>> +<cve@kernel.org>로 알려주시기 바랍니다.
>> +
>> +특정 CVE의 적용 가능성
>> +======================
>> +
>> +Linux 커널은 외부 사용자가 다양한 방법으로 접근하거나 전혀 접근하지 않는
>> +등 다양한 방식으로 사용될 수 있으므로 특정 CVE의 적용 여부는 Linux 사용자가
>> +결정할 사항이며 CVE 할당 팀의 권한이 아닙니다. 특정 CVE의 적용 가능성을
>> +판단하기 위해 우리에게 문의하지 마시기 바랍니다.
>> +
>> +또한 소스 트리가 매우 방대하고 어떤 시스템도 소스 트리의 작은 하위 집합만
>> +사용하므로 Linux 사용자는 할당된 많은 수의 CVE가 자신의 시스템과 관련이 없다는
>> +사실을 알고 인지해야 합니다.
>> +
>> +즉, 우리는 사용자의 사용 사례를 알지 못하며 사용자가 커널의 어떤 부분을
>> +사용하는지 알 수 없으므로 특정 CVE가 사용자의 시스템과 관련이 있는지 판단할 수
>> +있는 방법이 없습니다.
>> +
>> +항상 그렇듯이 커널 변경 사항은 개별적으로 선별된 변경 사항이 아니라 많은
>> +커뮤니티 구성원이 통합된 전체에서 함께 테스트하는 것이므로 릴리스된 모든 커널
>> +변경 사항을 적용하는 것이 가장 좋습니다. 또한 많은 버그의 경우 전체 문제에
>> +대한 해결책은 단일 변경 사항이 아니라 여러 수정 사항을 모아놓고 보아야 찾을 수
>> +있다는 점에 유의하세요. 이상적으로는 모든 문제에 대한 모든 수정 사항에 CVE가
>> +할당되지만, 때로는 수정 사항을 발견하지 못하는 경우가 있으므로 CVE가 할당되지
>> +않은 일부 변경 사항이 관련성이 있을 수 있다고 가정합니다.

