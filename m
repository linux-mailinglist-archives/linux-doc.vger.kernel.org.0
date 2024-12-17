Return-Path: <linux-doc+bounces-32993-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B979F452B
	for <lists+linux-doc@lfdr.de>; Tue, 17 Dec 2024 08:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4F161887902
	for <lists+linux-doc@lfdr.de>; Tue, 17 Dec 2024 07:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB6615B0EE;
	Tue, 17 Dec 2024 07:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="h/zPeLn1"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290E2179A7;
	Tue, 17 Dec 2024 07:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734420773; cv=none; b=mGVBRIQX8QEw4KhzktHj+2HPcIAQCLCfGrCm2+inz+iKn+WE7v+tnaHLzaUyZ2WjRBE7PWSJtUht4pmRUpbrkxJJYYv1cJfiZsZb9ws13y/9le+GUixsndE+ftqISVx77GJ/13IjCcyeRvR74Ossy6S/9sejBYgQIQzzeyiPdT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734420773; c=relaxed/simple;
	bh=KjcyutV+LUKObJJz8kI73mfXjx2M5XMk9HkD+bxSgXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pGCtVf/t/nYCyEJ/D3yioidrXqk+sxKrZJqe1wDGh1C0ju2YUdKO+D0dld7uh2CB2LOS4MnXF2pM40to2u7FpVpjHpH1rgzZpoNvrES7vCmXsEKVHUQoqni/rw3LfWLZBkJfD+huaXMyLhYPcTW0v+6+USahqtbal+VOcPcxWZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=h/zPeLn1; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from [192.168.1.148] (unknown [222.129.38.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 7684E3FEC1;
	Tue, 17 Dec 2024 07:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1734420768;
	bh=WmLuapaBcDLx20vBI443lQHJJcPEXOJ/SfKCg4vPqzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=h/zPeLn1m2LGNQMyi96SrFy6zni++2uPGbGUXWpa4cDy/beqVF0ULcPaIZg3gp4mW
	 OG5rJGzwon9COpw6Emhx7a0fKRSVlPElj69vN8zr+tpVIV9VWA9R7p23GyNV2NFF4j
	 DjHgqrT7wGrDHryYsobQFv/5X9FzrCgN8gkOtw+til7ZLlHRjH1lXRyejRlhmJOBu3
	 KKIj/18SaADpowAdmRO8r0p8TaR6BI8npZ7KIH17Z+JW8xgmMvqzMJ3kuXNvmKzaua
	 NjrS6bBFdGi83pOIqoNcB8oyVt6axYfLHliJcY7+M0TvvOFgjrpQyLGqo+MYW5com6
	 cBd/4joHZP2DA==
Message-ID: <2be37a02-d7aa-4587-a7a3-763840e98888@canonical.com>
Date: Tue, 17 Dec 2024 15:32:39 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 00/22] Add Intel Touch Host Controller drivers
To: "Xu, Even" <even.xu@intel.com>, "jikos@kernel.org" <jikos@kernel.org>,
 "bentiss@kernel.org" <bentiss@kernel.org>, "corbet@lwn.net"
 <corbet@lwn.net>, "bagasdotme@gmail.com" <bagasdotme@gmail.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20241216014127.3722172-1-even.xu@intel.com>
 <f529959b-2355-430b-afc1-fb3062cbbe60@canonical.com>
 <IA1PR11MB6098E6919DB15166C62C016DF4042@IA1PR11MB6098.namprd11.prod.outlook.com>
Content-Language: en-US
From: Aaron Ma <aaron.ma@canonical.com>
Autocrypt: addr=aaron.ma@canonical.com; keydata=
 xsBNBFffeLkBCACi4eE4dPsgWN6B9UDOVcAvb5QgU/hRG6yS0I1lGKQv4KA+bke0c5g8clbO
 9gIlIl2bityfA9NzBsDik4Iei3AxMbFyxv9keMwcOFQBIOZF0P3f05qjxftF8P+yp9QTV4hp
 BkFzsXzWRgXN3r8hU8wqZybepF4B1C83sm2kQ5A5N0AUGbZli9i2G+/VscG9sWfLy8T7f4YW
 MjmlijCjoV6k29vsmTWQPZ7EApNpvR5BnZQPmQWzkkr0lNXlsKcyLgefQtlwg6drK4fe4wz0
 ouBIHJEiXE1LWK1hUzkCUASra4WRwKk1Mv/NLLE/aJRqEvF2ukt3uVuM77RWfl7/H/v5ABEB
 AAHNIUFhcm9uIE1hIDxhYXJvbi5tYUBjYW5vbmljYWwuY29tPsLAdwQTAQgAIQUCV994uQIb
 AwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRDNxCzQfVU6ntJ9B/9aVy0+RkLqF9QpLmw+
 LAf1m3Fd+4ZarPTerqDqkLla3ekYhbrEtlI1mYuB5f+gtrIjmcW27gacHdslKB9YwaL8B4ZB
 GJKhcrntLg4YPzYUnXZkHHTv1hMw7fBYw82cBT+EbG0Djh6Po6Ihqyr3auHhfFcp1PZH4Mtq
 6hN5KaDZzF/go+tRF5e4bn61Nhdue7mrhFSlfkzLG2ehHWmRV+S91ksH81YDFnazK0sRINBx
 V1S8ts3WJ2f1AbgmnDlbK3c/AfI5YxnIHn/x2ZdXj1P/wn7DgZHmpMy5DMuk0gN34NLUPLA/
 cHeKoBAF8emugljiKecKBpMTLe8FrVOxbkrazsBNBFffeLkBCACweKP3Wx+gK81+rOUpuQ00
 sCyKzdtMuXXJ7oL4GzYHbLfJq+F+UHpQbytVGTn3R5+Y61v41g2zTYZooaC+Hs1+ixf+buG2
 +2LZjPSELWPNzH9lsKNlCcEvu1XhyyHkBDbnFFHWlUlql3nSXMo//dOTG/XGKaEaZUxjCLUC
 8ehLc16DJDvdXsPwWhHrCH/4k92F6qQ14QigBMsl75jDTDJMEYgRYEBT1D/bwxdIeoN1BfIG
 mYgf059RrWax4SMiJtVDSUuDOpdwoEcZ0FWesRfbFrM+k/XKiIbjMZSvLunA4FIsOdWYOob4
 Hh0rsm1G+fBLYtT+bE26OWpQ/lSn4TdhABEBAAHCwF8EGAEIAAkFAlffeLkCGwwACgkQzcQs
 0H1VOp6p5Af/ap5EVuP1AhFdPD3pXLNrUUt72W3cuAOjXyss43qFC2YRjGfktrizsDjQU46g
 VKoD6EW9XUPgvYM+k8BJEoXDLhHWnCnMKlbHP3OImxzLRhF4kdlnLicz1zKRcessQatRpJgG
 NIiD+eFyh0CZcWBO1BB5rWikjO/idicHao2stFdaBmIeXvhT9Xp6XNFEmzOmfHps+kKpWshY
 9LDAU0ERBNsW4bekOCa/QxfqcbZYRjrVQvya0EhrPhq0bBpzkIL/7QSBMcdv6IajTlHnLARF
 nAIofCEKeEl7+ksiRapL5Nykcbt4dldE3sQWxIybC94SZ4inENKw6I8RNpigWm0R5w==
In-Reply-To: <IA1PR11MB6098E6919DB15166C62C016DF4042@IA1PR11MB6098.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/17/24 2:58 PM, Xu, Even wrote:
> Hi, Aaron,
> 
> Thanks for testing!
> 
> It’s not a driver error, it just means driver detected a touch device error (Touch device report an unexpected RESET Response).
> 
> I also met the same issue during test, it usually happens during enumeration flow.
> 
> If user keep touching the screen before/during driver do device initialization, it will happen.
> 

During the booting, no touching.
It still repeats this error when driver is loading.

After system bootup and in idle, every single touch will report this error.

Aaron

> In general, Touch devices will self recover from this error, it will not impact normal touch function.
> 
> Thanks!
> 
> Best Regards,
> 
> Even Xu
> 
> *From:*Aaron Ma <aaron.ma@canonical.com>
> *Sent:* Tuesday, December 17, 2024 2:47 PM
> *To:* Xu, Even <even.xu@intel.com>; jikos@kernel.org; bentiss@kernel.org; corbet@lwn.net; bagasdotme@gmail.com; rdunlap@infradead.org
> *Cc:* linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; linux-doc@vger.kernel.org
> *Subject:* Re: [PATCH v3 00/22] Add Intel Touch Host Controller drivers
> 
> Hi Even,
> 
> Tested on 6.13-rc3, there is an error repeated when using touchscreen:
> 
> intel_quicki2c 0000:00:10.0: *unexpected DIR happen*
> 
> The device info:
> [    3.013613] input: quicki2c-hid 27C6:012D Touchscreen as /devices/pci0000:00/0000:00:10.0/000
> 1:27C6:012D.0001/input/input6
> [    3.013763] input: quicki2c-hid 27C6:012D as /devices/pci0000:00/0000:00:10.0/0001:27C6:012D.
> 0001/input/input7
> [    3.013894] hid-generic 0001:27C6:012D.0001: input,hidraw0: <UNKNOWN> HID v8.65 Device [quick
> i2c-hid 27C6:012D] on
> 
> 
> Aaron
> 
> On 12/16/24 9:41 AM, Even Xu wrote:
> 
>     Intel Touch Host Controller (THC) is a new high performance input IP
> 
>     which can benefit HID device's data transaction, such as touch screen,
> 
>     touch pad, stylus.
> 
>     THC IP now evoluates to V4, it can support 3 different modes: IPTS,
> 
>     HIDSPI and HIDI2C. Here are upgrade history:
> 
>     - THC v1, for TGL/LKF, supports intel private IPTS (Intel Precise Touch
> 
>        and Stylus) protocol ( IPTS mode)
> 
>     - THC v2, for ADL, add industrial standard HID over SPI protocol support
> 
>        (HIDSPI mode)
> 
>     - THC v3, for MTL, enhance HID over SPI mode
> 
>     - THC v4, for LNL, add inudstrial standard HID over I2C protocol support
> 
>        (HIDI2C mode)
> 
>     Linux Surface community (https://github.com/linux-surface <https://github.com/linux-surface>) already
> 
>     implemented IPTS mode. These patch series provides THC HIDSPI mode and
> 
>     THC HIDI2C mode support on Linux.
> 
>     These patch series includes:
> 
>     1. Document for THC hardware and software introduction.
> 
>     2. Intel THC Hardware layer driver which provides control interfaces
> 
>         for protocol layer.
> 
>     3. Intel QuickSPI (R) driver working as a HIDSPI device driver which
> 
>         implements HID over SPI protocol and flow.
> 
>     4. Intel QuickI2C (R) driver working as a HIDI2C device driver which
> 
>         implements HID over I2C protocol and flow.
> 
>     Change logs:
> 
>     v3:
> 
>     - Change tables in documents from literal block to table format
> 
>     - Change symbol namespace to string literal according to patch:
> 
>        cdd30ebb1b9f ("module: Convert symbol namespace to string literal")
> 
>     - Refine Kconfig description
> 
>     - Enhance Quickspi and Quicki2c driver by clearing THC hardware interal
> 
>        state before doing initialization to avoid BIOS impacts.
> 
>     - A fix in Quicki2c driver when does set_report
> 
>     v2:
> 
>     - Fix document format issues
> 
>     - Add THC device IDs for Intel Panther Lake (PTL) platform
> 
>     Even Xu (13):
> 
>        HID: THC: Add documentation
> 
>        HID: intel-thc-hid: intel-thc: Add THC DMA interfaces
> 
>        HID: intel-thc-hid: intel-thc: Add THC I2C config interfaces
> 
>        HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI driver hid layer
> 
>        HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI ACPI interfaces
> 
>        HID: intel-thc-hid: intel-quickspi: Add HIDSPI protocol implementation
> 
>        HID: intel-thc-hid: intel-quickspi: Add PM implementation
> 
>        HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C driver skeleton
> 
>        HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C driver hid layer
> 
>        HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C ACPI interfaces
> 
>        HID: intel-thc-hid: intel-quicki2c: Add HIDI2C protocol implementation
> 
>        HID: intel-thc-hid: intel-quicki2c: Complete THC QuickI2C driver
> 
>        HID: intel-thc-hid: intel-quicki2c: Add PM implementation
> 
>     Xinpeng Sun (9):
> 
>        HID: intel-thc-hid: Add basic THC driver skeleton
> 
>        HID: intel-thc-hid: intel-thc: Add THC registers definition
> 
>        HID: intel-thc-hid: intel-thc: Add THC PIO operation APIs
> 
>        HID: intel-thc-hid: intel-thc: Add APIs for interrupt
> 
>        HID: intel-thc-hid: intel-thc: Add THC LTR interfaces
> 
>        HID: intel-thc-hid: intel-thc: Add THC interrupt handler
> 
>        HID: intel-thc-hid: intel-thc: Add THC SPI config interfaces
> 
>        HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI driver skeleton
> 
>        HID: intel-thc-hid: intel-quickspi: Complete THC QuickSPI driver
> 
>       Documentation/hid/index.rst                   |    1 +
> 
>       Documentation/hid/intel-thc-hid.rst           |  568 ++++++
> 
>       MAINTAINERS                                   |    6 +
> 
>       drivers/hid/Kconfig                           |    2 +
> 
>       drivers/hid/Makefile                          |    2 +
> 
>       drivers/hid/intel-thc-hid/Kconfig             |   42 +
> 
>       drivers/hid/intel-thc-hid/Makefile            |   22 +
> 
>       .../intel-quicki2c/pci-quicki2c.c             |  966 ++++++++++
> 
>       .../intel-quicki2c/quicki2c-dev.h             |  186 ++
> 
>       .../intel-quicki2c/quicki2c-hid.c             |  166 ++
> 
>       .../intel-quicki2c/quicki2c-hid.h             |   14 +
> 
>       .../intel-quicki2c/quicki2c-protocol.c        |  224 +++
> 
>       .../intel-quicki2c/quicki2c-protocol.h        |   20 +
> 
>       .../intel-quickspi/pci-quickspi.c             |  987 +++++++++++
> 
>       .../intel-quickspi/quickspi-dev.h             |  172 ++
> 
>       .../intel-quickspi/quickspi-hid.c             |  165 ++
> 
>       .../intel-quickspi/quickspi-hid.h             |   14 +
> 
>       .../intel-quickspi/quickspi-protocol.c        |  409 +++++
> 
>       .../intel-quickspi/quickspi-protocol.h        |   25 +
> 
>       .../intel-thc-hid/intel-thc/intel-thc-dev.c   | 1578 +++++++++++++++++
> 
>       .../intel-thc-hid/intel-thc/intel-thc-dev.h   |  116 ++
> 
>       .../intel-thc-hid/intel-thc/intel-thc-dma.c   |  969 ++++++++++
> 
>       .../intel-thc-hid/intel-thc/intel-thc-dma.h   |  146 ++
> 
>       .../intel-thc-hid/intel-thc/intel-thc-hw.h    |  881 +++++++++
> 
>       include/linux/hid-over-i2c.h                  |  117 ++
> 
>       include/linux/hid-over-spi.h                  |  155 ++
> 
>       26 files changed, 7953 insertions(+)
> 
>       create mode 100644 Documentation/hid/intel-thc-hid.rst
> 
>       create mode 100644 drivers/hid/intel-thc-hid/Kconfig
> 
>       create mode 100644 drivers/hid/intel-thc-hid/Makefile
> 
>       create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> 
>       create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> 
>       create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
> 
>       create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.h
> 
>       create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
> 
>       create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
> 
>       create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> 
>       create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
> 
>       create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
> 
>       create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.h
> 
>       create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
> 
>       create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.h
> 
>       create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
> 
>       create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
> 
>       create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
> 
>       create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
> 
>       create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
> 
>       create mode 100644 include/linux/hid-over-i2c.h
> 
>       create mode 100644 include/linux/hid-over-spi.h
> 


