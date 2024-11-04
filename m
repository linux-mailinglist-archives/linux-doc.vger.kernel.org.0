Return-Path: <linux-doc+bounces-29753-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 430BA9BAE0D
	for <lists+linux-doc@lfdr.de>; Mon,  4 Nov 2024 09:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07EEE28308C
	for <lists+linux-doc@lfdr.de>; Mon,  4 Nov 2024 08:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B501ABEBA;
	Mon,  4 Nov 2024 08:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="x72OK5xn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626E71ABEA7
	for <linux-doc@vger.kernel.org>; Mon,  4 Nov 2024 08:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730708928; cv=none; b=FSWJiclvoR7OX+1nBmeCQow+w5nqcL4DNtlrl6zXXetiojeb4bJc+rc7yw8hEu0Se+4iecSCn8LQ3H0eNXqtgnt8R+qygBgNc0RxMnOaJea6pnn+CCRNLS08POxAQiCIq9tz22XSqn1IlV4Jen9qLlDAkoGrekflYbMzY12hyQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730708928; c=relaxed/simple;
	bh=EqmkgE4d1EEXvy/pDugSAzsTbmYi0+HKJ6jyxFzBlW4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hcJDX3OSWWxQsAaaloj3p4b0/hXVM3f1gcAeIDrRYcX3qwAfEnT0M6gqJV/f802zJUbAw06creTfYH/2FFrDyHAuD6fQvTlPqu4hdjR38EC9N/jeUS2Mm45wLTZmCgQUWbQkSPYZJkvW1SCoF+V2w2zUuGyZo70TEg/SsYNLFDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=x72OK5xn; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so30353095e9.2
        for <linux-doc@vger.kernel.org>; Mon, 04 Nov 2024 00:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730708925; x=1731313725; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iuww1TS1OQs3l9SRwzJ7P35d568foJ3WYH7zYhElvvU=;
        b=x72OK5xnzt8xcWkdu6xV5VgCtuhWDba5wGQ4ni7HaEfPXvYc65vIY0g/FjESNuj81g
         1Ao31LMHpmlXD0RuGPmwiwh/QsRmDb9LxXXTPbzSFbOK/8UrhHNCpkrP9dSex9jcnjR4
         aYhpDiRbud1/nl+CKWkarzXTVqkiAtpIcpmVAoT0B2GGXLxurCokMHwVOUJ+qduETDTx
         gA83rv6J+em2PrkvqYI2VFSIN2sSf3lTrij2EUFsbUc+4aqW9yPPv32JHTpNQJWZX94h
         YRPRqr49CBYS1yn+FEGkRjQl8TxOT2Au4uZcSGkTxB0xzOAGMT9gd3L+hhGB+SzpFjYS
         WDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730708925; x=1731313725;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iuww1TS1OQs3l9SRwzJ7P35d568foJ3WYH7zYhElvvU=;
        b=VcnPoTjVHy0KJH0lokm2qkEYLeUemAJapp5Yjnf+aoUShAK8W0q+lCQpQdYkr2OLNi
         9AGiE6Lp+B/yuLe6n4jvL4dLZd2Yo7KOxw4hND0iTcvlop1g5TRmh8NJ8Do4iH2Qr84I
         lTh6I5djGiEd3tM/JFcSqr7qLvnA3c1ijX7fqBnJDBfczMP2u3fpJB8dMPsM4fzi5CTr
         9W15da4LI0XXPlPAP+MXL1FImuuC3ClOXPlfs7lIMV9OweTqz/PQq5qP7/cawby+Cawz
         L1B0LHdJLITlyVW/OsEpS6cWYDeniOxciXO2sHUSZWF4fBjbqUkX3rbD4SChbzrAwvZR
         oErQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcUbtNVKTbuQ2wuoPDkLTju+MFkvmd0eDUIqgOI8AcH3YKK4iXaxfMe9zVC1tm6b1PCW9cfryaDvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLb8JTuDm8zSyWJUp5lHFs9bqnY0sTWmcz34dQ4ugaJhRaQbIr
	nOM2KlThS7Jjh91SwCzZ7Gi3grTDNHXtFPG5Kwj2gWVgoq6rw6M8JZF7ClduWhU=
X-Google-Smtp-Source: AGHT+IH1WfaHxfpzCD8if1ibEm5hwL1R88iNPhaHc0ElvUyQHLLOZjwnM6Wwr2C8DTF0zlQaa7BhsQ==
X-Received: by 2002:a5d:46d0:0:b0:37d:41cd:ba4e with SMTP id ffacd0b85a97d-381b710dab4mr11534469f8f.48.1730708924645;
        Mon, 04 Nov 2024 00:28:44 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:3924:2486:a349:2c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d40casm12550078f8f.27.2024.11.04.00.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 00:28:43 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>,  Jonathan Corbet <corbet@lwn.net>,
  Patrick Rudolph <patrick.rudolph@9elements.com>,  Naresh Solanki
 <naresh.solanki@9elements.com>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
  linux-hwmon@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 4/6] hwmon: (pmbus/core) clear faults after setting
 smbalert mask
In-Reply-To: <fa3ccd3b-7dab-45b2-92ec-49400e39114c@roeck-us.net> (Guenter
	Roeck's message of "Fri, 1 Nov 2024 08:10:27 -0700")
References: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
	<20241024-tps25990-v3-4-b6a6e9d4b506@baylibre.com>
	<fa3ccd3b-7dab-45b2-92ec-49400e39114c@roeck-us.net>
Date: Mon, 04 Nov 2024 09:28:42 +0100
Message-ID: <1jo72v5rnp.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 01 Nov 2024 at 08:10, Guenter Roeck <linux@roeck-us.net> wrote:

> On Thu, Oct 24, 2024 at 08:10:38PM +0200, Jerome Brunet wrote:
>> pmbus_write_smbalert_mask() ignores the errors if the chip can't set
>> smbalert mask the standard way. It is not necessarily a problem for the irq
>> support if the chip is otherwise properly setup but it may leave an
>> uncleared fault behind.
>> 
>> pmbus_core will pick the fault on the next register_check(). The register
>> check will fails regardless of the actual register support by the chip.
>> 
>> This leads to missing attributes or debugfs entries for chips that should
>> provide them.
>> 
>> We cannot rely on register_check() as PMBUS_SMBALERT_MASK may be read-only.
>> 
>> Unconditionally clear the page fault after setting PMBUS_SMBALERT_MASK to
>> avoid the problem.
>> 
>> Suggested-by: Guenter Roeck <linux@roeck-us.net>
>> Fixes: 221819ca4c36 ("hwmon: (pmbus/core) Add interrupt support")
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/hwmon/pmbus/pmbus_core.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>> index ce697ca03de01c0e5a352f8f6b72671137721868..a0a397d571caa1a6620ef095f9cf63d94e8bda1d 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>> @@ -3346,7 +3346,12 @@ static int pmbus_regulator_notify(struct pmbus_data *data, int page, int event)
>>  
>>  static int pmbus_write_smbalert_mask(struct i2c_client *client, u8 page, u8 reg, u8 val)
>>  {
>> -	return _pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK, reg | (val << 8));
>> +	int ret;
>> +
>> +	ret = _pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK, reg | (val << 8));
>> +	pmbus_clear_fault_page(client, -1);
>
> Why -1 and not page ?

The idea was to clear the fault on the page we are on, basically just skipping
setting the page again.

I'll change to 'page'

>
> Guenter

-- 
Jerome

