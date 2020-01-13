Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC3271394B4
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jan 2020 16:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728988AbgAMPWn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 13 Jan 2020 10:22:43 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32906 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728811AbgAMPWn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jan 2020 10:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578928961;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VOTGMvgDQlL7dRbs3ZO0Cylb6qsjQ7963pN+mQ0JZwc=;
        b=PfcFbwBseCR56yGf3vMdHiX/Xs05gX37iVXiXndqnFiL4Jv5XugqskjnzPfzZu+ltc9QGH
        z6rOpinEmysQLnHsRzKmvw1nQ4Y/N5Pwt3X9sPL4XEuCKcf68dp8Qifc4C2gbJ1f+P3Ink
        +u0DPhjBc5WE0qBbuH9eP3h6vOSzs68=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-uLDX83GuMY-sMkqaEKXSKg-1; Mon, 13 Jan 2020 10:22:39 -0500
X-MC-Unique: uLDX83GuMY-sMkqaEKXSKg-1
Received: by mail-wm1-f72.google.com with SMTP id t16so2615526wmt.4
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2020 07:22:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VOTGMvgDQlL7dRbs3ZO0Cylb6qsjQ7963pN+mQ0JZwc=;
        b=U5gD9/860YWVBJsnL7XqbcEnCAbjIjr5aMp5xXQGK1BDDIsXaTef8AyixtEM/7ZGOe
         J1e85lncxWeZEQzD+Z8bOPgWwbrXBwbhOSenGjCCXkOCzqeoSuq+iXmcdLe1yUeBnOfb
         xNrbmPqlZ6BF+5AI4tq3ZgGXZwBdOkb7chLb7Vu3WrgBO8te+3HJLuwCIfpnmwZYOmEQ
         wgmCvuNKGkXDmzAYAy7tZ7N/07amKhQ1xUeIPDp5NJHqrIKXc5rFbPAvgHqn1Iay2Ed6
         e7eNtvFgBAhIjWPQ8A/HHL6+JpkhawHx5bP8P+x6lPuKsqUYv/eidusMaew1ptEbVYHt
         Fk4Q==
X-Gm-Message-State: APjAAAW03caAvMk4HD9irJQq2h79LsfQE/Zx0O+R8pS5s8ECdHzTNorV
        0QVmHoUOJDDI9bPuXtp9EAjgfj5vQ+32V5iiJuz9ctA2UZigbuBAu6KXh81SCE4AspH7uaUIsst
        rGk5xw5IWbeTN90fiAHsE
X-Received: by 2002:a1c:a406:: with SMTP id n6mr20939394wme.40.1578928958682;
        Mon, 13 Jan 2020 07:22:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqyUmkECQJyn5SeeaSEv+fAyzoafrVckwo+t9N110O05ZIO2UB7J1Jik4S2xxmzSNHA+roPuQw==
X-Received: by 2002:a1c:a406:: with SMTP id n6mr20939363wme.40.1578928958439;
        Mon, 13 Jan 2020 07:22:38 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id j12sm16877545wrw.54.2020.01.13.07.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2020 07:22:37 -0800 (PST)
Subject: Re: [PATCH v11 05/10] test_firmware: add support for
 firmware_request_platform
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Jones <pjones@redhat.com>,
        Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20200111145703.533809-1-hdegoede@redhat.com>
 <20200111145703.533809-6-hdegoede@redhat.com>
 <20200113145328.GA11244@42.do-not-panic.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <54f70265-265b-ad23-7d2d-af0b27ab1475@redhat.com>
Date:   Mon, 13 Jan 2020 16:22:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200113145328.GA11244@42.do-not-panic.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 13-01-2020 15:53, Luis Chamberlain wrote:
> On Sat, Jan 11, 2020 at 03:56:58PM +0100, Hans de Goede wrote:
>> Add support for testing firmware_request_platform through a new
>> trigger_request_platform trigger.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v11:
>> - Drop a few empty lines which were accidentally introduced
> 
> But you didn't address my other feedback.
> 
>> --- a/lib/test_firmware.c
>> +++ b/lib/test_firmware.c
>> @@ -507,6 +508,61 @@ static ssize_t trigger_request_store(struct device *dev,
>>   }
>>   static DEVICE_ATTR_WO(trigger_request);
>>   
>> +#ifdef CONFIG_EFI_EMBEDDED_FIRMWARE
>> +static ssize_t trigger_request_platform_store(struct device *dev,
>> +					      struct device_attribute *attr,
>> +					      const char *buf, size_t count)
>> +{
>> +	static const u8 test_data[] = {
>> +		0x55, 0xaa, 0x55, 0xaa, 0x01, 0x02, 0x03, 0x04,
>> +		0x55, 0xaa, 0x55, 0xaa, 0x05, 0x06, 0x07, 0x08,
>> +		0x55, 0xaa, 0x55, 0xaa, 0x10, 0x20, 0x30, 0x40,
>> +		0x55, 0xaa, 0x55, 0xaa, 0x50, 0x60, 0x70, 0x80
>> +	};
>> +	struct efi_embedded_fw fw;
>> +	int rc;
>> +	char *name;
>> +
>> +	name = kstrndup(buf, count, GFP_KERNEL);
>> +	if (!name)
>> +		return -ENOSPC;
>> +
>> +	pr_info("inserting test platform fw '%s'\n", name);
>> +	fw.name = name;
>> +	fw.data = (void *)test_data;
>> +	fw.length = sizeof(test_data);
>> +	list_add(&fw.list, &efi_embedded_fw_list);
>> +
>> +	pr_info("loading '%s'\n", name);
>> +
> 
> I mentioned this in my last review, and it seems you forgot to address
> this.

I did address this in my reply to your review, as explained there,
the check + free on test_firmware before calling firmware_request_platform()
is necessary because test_firmware may be non NULL when entering
the function (continued below) ...

> But now some more feedback:
> 
> These two:
> 
>> +	mutex_lock(&test_fw_mutex);
>> +	release_firmware(test_firmware);
> 
> You are doing this because this is a test, but a typical driver will
> do this after, and we don't loose anything in doing this after. Can you
> move the mutex lock and assign the pointer to a temporary used pointer
> for the call, *after* your call.
> 
> But since your test is not using any interfaces to query information
> about the firmware, and you are just doing the test in C code right
> away, instead of say, using a trigger for later use in userspace,
> you can just do away with the mutex lock and make the call use its
> own pointer:
> 
> 	rc = firmware_request_platform(&tmp_test_firmware, name, dev);
> 	if (rc) {
> 		...
> 	}
> 	/* Your test branch code goes here */
> 
> I see no reason why you use the test_firmware pointer.

I agree that using a private/local firmware pointer instead of
test_firmware and dropping the mutex calls is better. I will make
this change for v12 of this series.

I'll send out a v12 once the remarks from Andy Lutomirski's
have also been discussed.

Regards,

Hans


> 
>> +	test_firmware = NULL;
>> +	rc = firmware_request_platform(&test_firmware, name, dev);
>> +	if (rc) {
>> +		pr_info("load of '%s' failed: %d\n", name, rc);
>> +		goto out;
>> +	}
>> +	if (test_firmware->size != sizeof(test_data) ||
>> +	    memcmp(test_firmware->data, test_data, sizeof(test_data)) != 0) {
>> +		pr_info("firmware contents mismatch for '%s'\n", name);
>> +		rc = -EINVAL;
>> +		goto out;
>> +	}
>> +	pr_info("loaded: %zu\n", test_firmware->size);
>> +	rc = count;
>> +
>> +out:
>> +	mutex_unlock(&test_fw_mutex);
>> +
>> +	list_del(&fw.list);
>> +	kfree(name);
>> +
>> +	return rc;
>> +}
> 

