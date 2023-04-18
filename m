Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 342C86E5ED4
	for <lists+linux-doc@lfdr.de>; Tue, 18 Apr 2023 12:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbjDRKbw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 18 Apr 2023 06:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230501AbjDRKbv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Apr 2023 06:31:51 -0400
Received: from mx2.veeam.com (mx2.veeam.com [64.129.123.6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B927686;
        Tue, 18 Apr 2023 03:31:43 -0700 (PDT)
Received: from mail.veeam.com (prgmbx01.amust.local [172.24.128.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx2.veeam.com (Postfix) with ESMTPS id 9BAEE40654;
        Tue, 18 Apr 2023 06:31:39 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veeam.com;
        s=mx2-2022; t=1681813899;
        bh=Ieh/gUYRt5bSe/KdKXCdJWHx36/0H7fpYMY5BgBqHkw=;
        h=Date:Subject:From:To:CC:References:In-Reply-To:From;
        b=FHdgIvLEdzfYWs6a1UEMNuw+e5IR4GaNwsIIVmqX8CQbKdpdBPly+NyoGAxGGXVvg
         Q0DaBm7guu/cf8w4puslV0lVWpdLgD4AxCtEikS5ypeNs61nT7TTdE4xoeWZzejC05
         E0hHXIuw43q7DknAk/1Jr8g5verfN6kSh9QxtJIfUKX4tEXdf0NCF1/W24HbcXsQSL
         yyZUefH61ZFraVALCirHmAYXQ/z6D8ABRKTj1bYkYuw6bj6GRYORzobmeUmrTYpyza
         uSKZwHJOMYBMVHCEaQbfjMsWCMloMwLpHYcyFlhqtr0Ak3J63iHJEPW39dacBxWNmI
         Cc7z50hvQeCXQ==
Received: from [172.24.10.107] (172.24.10.107) by prgmbx01.amust.local
 (172.24.128.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 18 Apr
 2023 12:31:32 +0200
Content-Type: multipart/mixed;
        boundary="------------diCWIp10pf2zmtUlXbMXuLz7"
Message-ID: <a1854604-cec1-abd5-1d49-6cf6a19ee7a1@veeam.com>
Date:   Tue, 18 Apr 2023 12:31:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 03/11] documentation: Block Devices Snapshots Module
Content-Language: en-US
From:   Sergei Shtepa <sergei.shtepa@veeam.com>
To:     Donald Buczek <buczek@molgen.mpg.de>, <axboe@kernel.dk>,
        <hch@infradead.org>, <corbet@lwn.net>, <snitzer@kernel.org>
CC:     <viro@zeniv.linux.org.uk>, <brauner@kernel.org>,
        <willy@infradead.org>, <kch@nvidia.com>,
        <martin.petersen@oracle.com>, <vkoul@kernel.org>,
        <ming.lei@redhat.com>, <gregkh@linuxfoundation.org>,
        <linux-block@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
References: <20230404140835.25166-1-sergei.shtepa@veeam.com>
 <20230404140835.25166-4-sergei.shtepa@veeam.com>
 <cb0cc2f1-48cb-8b15-35af-33a31ccc922c@molgen.mpg.de>
 <86068780-bab3-2fc2-3f6f-1868be119b38@veeam.com>
In-Reply-To: <86068780-bab3-2fc2-3f6f-1868be119b38@veeam.com>
X-Originating-IP: [172.24.10.107]
X-ClientProxiedBy: colmbx01.amust.local (172.31.112.31) To
 prgmbx01.amust.local (172.24.128.102)
X-EsetResult: clean, is OK
X-EsetId: 37303A2924031554677465
X-Veeam-MMEX: True
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--------------diCWIp10pf2zmtUlXbMXuLz7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit



On 4/14/23 14:34, Sergei Shtepa wrote:
> Subject:
> Re: [PATCH v3 03/11] documentation: Block Devices Snapshots Module
> From:
> Sergei Shtepa <sergei.shtepa@veeam.com>
> Date:
> 4/14/23, 14:34
> 
> To:
> Donald Buczek <buczek@molgen.mpg.de>, axboe@kernel.dk, hch@infradead.org, corbet@lwn.net, snitzer@kernel.org
> CC:
> viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, kch@nvidia.com, martin.petersen@oracle.com, vkoul@kernel.org, ming.lei@redhat.com, gregkh@linuxfoundation.org, linux-block@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
> 
> 
> 
> On 4/12/23 21:38, Donald Buczek wrote:
>> Subject:
>> Re: [PATCH v3 03/11] documentation: Block Devices Snapshots Module
>> From:
>> Donald Buczek <buczek@molgen.mpg.de>
>> Date:
>> 4/12/23, 21:38
>>
>> To:
>> Sergei Shtepa <sergei.shtepa@veeam.com>, axboe@kernel.dk, hch@infradead.org, corbet@lwn.net, snitzer@kernel.org
>> CC:
>> viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, kch@nvidia.com, martin.petersen@oracle.com, vkoul@kernel.org, ming.lei@redhat.com, gregkh@linuxfoundation.org, linux-block@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
>>
>>
>> I think, you can trigger all kind of user-after-free when userspace deletes a snapshot image or the snapshot image and the tracker while the disk device snapshot image is kept alive (mounted or just opened) and doing I/O.
>>
>> Here is what I did to provoke that:
>>
>> root@dose:~# s=$(blksnap snapshot_create -d /dev/vdb)
>> root@dose:~# blksnap snapshot_appendstorage -i $s -f /scratch/local/test.dat
>> device path: '/dev/block/253:2'
>> allocate range: ofs=11264624 cnt=2097152
>> root@dose:~# blksnap snapshot_take -i $s
>> root@dose:~# mount /dev/blksnap-image_253\:16 /mnt
>> root@dose:~# dd if=/dev/zero of=/mnt/x.x &
>> [1] 2514
>> root@dose:~# blksnap snapshot_destroy -i $s
>> dd: writing to '/mnt/x.x': No space left on device
>> 1996041+0 records in
>> 1996040+0 records out
>> 1021972480 bytes (1.0 GB, 975 MiB) copied, 8.48923 s, 120 MB/s
>> [1]+  Exit 1                  dd if=/dev/zero of=/mnt/x.x
>>
> Thanks!
> I am very glad that the blksnap tool turned out to be useful in the review.
> This snapshot deletion scenario is not the most typical, but of course it is
> quite possible.
> I will need to solve this problem and add such a scenario to the test suite.
> 

Hi!

I have redesign the logic of ownership of the diff_area structure.
See patch in attach or commit.
Link: https://github.com/SergeiShtepa/linux/commit/7e927c381dcd2b2293be8315897a224d111b6f88
A test script for such a scenario has been added.
Link: https://github.com/veeam/blksnap/commit/fd0559dfedf094901d08bbf185fed288f0156433

I will be glad of any feedback.
--------------diCWIp10pf2zmtUlXbMXuLz7
Content-Type: text/x-patch; charset="UTF-8";
	name="fix_diff_area_ownership.patch"
Content-Disposition: attachment; filename="fix_diff_area_ownership.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svYmxrc25hcC9jaHVuay5jIGIvZHJpdmVycy9i
bG9jay9ibGtzbmFwL2NodW5rLmMKaW5kZXggODMyMjI4NjNkMzQ4Li43MzExM2M3MTRhYzEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svYmxrc25hcC9jaHVuay5jCisrKyBiL2RyaXZl
cnMvYmxvY2svYmxrc25hcC9jaHVuay5jCkBAIC02LDcgKzYsNiBAQAogI2luY2x1ZGUgPGxp
bnV4L3NsYWIuaD4KICNpbmNsdWRlICJjaHVuay5oIgogI2luY2x1ZGUgImRpZmZfYnVmZmVy
LmgiCi0jaW5jbHVkZSAiZGlmZl9hcmVhLmgiCiAjaW5jbHVkZSAiZGlmZl9zdG9yYWdlLmgi
CiAjaW5jbHVkZSAicGFyYW1zLmgiCiAKQEAgLTI3LDM1ICsyNiwzMCBAQCBzdGF0aWMgaW5s
aW5lIHNlY3Rvcl90IGNodW5rX3NlY3RvcihzdHJ1Y3QgY2h1bmsgKmNodW5rKQogCSAgICAg
ICA8PCAoY2h1bmstPmRpZmZfYXJlYS0+Y2h1bmtfc2hpZnQgLSBTRUNUT1JfU0hJRlQpOwog
fQogCi12b2lkIGNodW5rX2RpZmZfYnVmZmVyX3JlbGVhc2Uoc3RydWN0IGNodW5rICpjaHVu
aykKLXsKLQlpZiAodW5saWtlbHkoIWNodW5rLT5kaWZmX2J1ZmZlcikpCi0JCXJldHVybjsK
LQotCWRpZmZfYnVmZmVyX3JlbGVhc2UoY2h1bmstPmRpZmZfYXJlYSwgY2h1bmstPmRpZmZf
YnVmZmVyKTsKLQljaHVuay0+ZGlmZl9idWZmZXIgPSBOVUxMOwotfQotCiB2b2lkIGNodW5r
X3N0b3JlX2ZhaWxlZChzdHJ1Y3QgY2h1bmsgKmNodW5rLCBpbnQgZXJyb3IpCiB7Ci0Jc3Ry
dWN0IGRpZmZfYXJlYSAqZGlmZl9hcmVhID0gY2h1bmstPmRpZmZfYXJlYTsKKwlzdHJ1Y3Qg
ZGlmZl9hcmVhICpkaWZmX2FyZWEgPSBkaWZmX2FyZWFfZ2V0KGNodW5rLT5kaWZmX2FyZWEp
OwogCiAJV0FSTl9PTl9PTkNFKGNodW5rLT5zdGF0ZSAhPSBDSFVOS19TVF9ORVcgJiYKIAkJ
ICAgICBjaHVuay0+c3RhdGUgIT0gQ0hVTktfU1RfSU5fTUVNT1JZKTsKIAljaHVuay0+c3Rh
dGUgPSBDSFVOS19TVF9GQUlMRUQ7CiAKLQljaHVua19kaWZmX2J1ZmZlcl9yZWxlYXNlKGNo
dW5rKTsKKwlpZiAobGlrZWx5KGNodW5rLT5kaWZmX2J1ZmZlcikpIHsKKwkJZGlmZl9idWZm
ZXJfcmVsZWFzZShkaWZmX2FyZWEsIGNodW5rLT5kaWZmX2J1ZmZlcik7CisJCWNodW5rLT5k
aWZmX2J1ZmZlciA9IE5VTEw7CisJfQogCWRpZmZfc3RvcmFnZV9mcmVlX3JlZ2lvbihjaHVu
ay0+ZGlmZl9yZWdpb24pOwogCWNodW5rLT5kaWZmX3JlZ2lvbiA9IE5VTEw7CiAKLQl1cCgm
Y2h1bmstPmxvY2spOworCWNodW5rX3VwKGNodW5rKTsKIAlpZiAoZXJyb3IpCiAJCWRpZmZf
YXJlYV9zZXRfY29ycnVwdGVkKGRpZmZfYXJlYSwgZXJyb3IpOworCWRpZmZfYXJlYV9wdXQo
ZGlmZl9hcmVhKTsKIH07CiAKIHN0YXRpYyB2b2lkIGNodW5rX3NjaGVkdWxlX3N0b3Jpbmco
c3RydWN0IGNodW5rICpjaHVuaykKIHsKLQlzdHJ1Y3QgZGlmZl9hcmVhICpkaWZmX2FyZWEg
PSBjaHVuay0+ZGlmZl9hcmVhOworCXN0cnVjdCBkaWZmX2FyZWEgKmRpZmZfYXJlYSA9IGRp
ZmZfYXJlYV9nZXQoY2h1bmstPmRpZmZfYXJlYSk7CiAJaW50IHF1ZXVlX2NvdW50OwogCiAJ
V0FSTl9PTl9PTkNFKGNodW5rLT5zdGF0ZSAhPSBDSFVOS19TVF9ORVcgJiYKQEAgLTY3LDEx
ICs2MSwxMiBAQCBzdGF0aWMgdm9pZCBjaHVua19zY2hlZHVsZV9zdG9yaW5nKHN0cnVjdCBj
aHVuayAqY2h1bmspCiAJcXVldWVfY291bnQgPSBhdG9taWNfaW5jX3JldHVybigmZGlmZl9h
cmVhLT5zdG9yZV9xdWV1ZV9jb3VudCk7CiAJc3Bpbl91bmxvY2soJmRpZmZfYXJlYS0+c3Rv
cmVfcXVldWVfbG9jayk7CiAKLQl1cCgmY2h1bmstPmxvY2spOworCWNodW5rX3VwKGNodW5r
KTsKIAogCS8qIEluaXRpYXRlIHRoZSBxdWV1ZSBjbGVhcmluZyBwcm9jZXNzICovCiAJaWYg
KHF1ZXVlX2NvdW50ID4gZ2V0X2NodW5rX21heGltdW1faW5fcXVldWUoKSkKIAkJcXVldWVf
d29yayhzeXN0ZW1fd3EsICZkaWZmX2FyZWEtPnN0b3JlX3F1ZXVlX3dvcmspOworCWRpZmZf
YXJlYV9wdXQoZGlmZl9hcmVhKTsKIH0KIAogdm9pZCBjaHVua19jb3B5X2JpbyhzdHJ1Y3Qg
Y2h1bmsgKmNodW5rLCBzdHJ1Y3QgYmlvICpiaW8sCkBAIC0xOTMsNyArMTg4LDcgQEAgc3Rh
dGljIHZvaWQgbm90aWZ5X2xvYWRfYW5kX3NjaGVkdWxlX2lvKHN0cnVjdCB3b3JrX3N0cnVj
dCAqd29yaykKIAkJCWNvbnRpbnVlOwogCQl9CiAJCWlmIChjaHVuay0+c3RhdGUgPT0gQ0hV
TktfU1RfRkFJTEVEKSB7Ci0JCQl1cCgmY2h1bmstPmxvY2spOworCQkJY2h1bmtfdXAoY2h1
bmspOwogCQkJY29udGludWU7CiAJCX0KIApAQCAtMjE3LDcgKzIxMiw3IEBAIHN0YXRpYyB2
b2lkIG5vdGlmeV9sb2FkX2FuZF9wb3N0cG9uZV9pbyhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndv
cmspCiAJCQljb250aW51ZTsKIAkJfQogCQlpZiAoY2h1bmstPnN0YXRlID09IENIVU5LX1NU
X0ZBSUxFRCkgewotCQkJdXAoJmNodW5rLT5sb2NrKTsKKwkJCWNodW5rX3VwKGNodW5rKTsK
IAkJCWNvbnRpbnVlOwogCQl9CiAKQEAgLTI0MywzOCArMjM4LDE3IEBAIHN0YXRpYyB2b2lk
IGNodW5rX25vdGlmeV9zdG9yZShzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiAJCVdBUk5f
T05fT05DRShjaHVuay0+c3RhdGUgIT0gQ0hVTktfU1RfSU5fTUVNT1JZKTsKIAkJY2h1bmst
PnN0YXRlID0gQ0hVTktfU1RfU1RPUkVEOwogCi0JCWNodW5rX2RpZmZfYnVmZmVyX3JlbGVh
c2UoY2h1bmspOwotCQl1cCgmY2h1bmstPmxvY2spOworCQlpZiAoY2h1bmstPmRpZmZfYnVm
ZmVyKSB7CisJCQlkaWZmX2J1ZmZlcl9yZWxlYXNlKGNodW5rLT5kaWZmX2FyZWEsCisJCQkJ
CSAgICBjaHVuay0+ZGlmZl9idWZmZXIpOworCQkJY2h1bmstPmRpZmZfYnVmZmVyID0gTlVM
TDsKKwkJfQorCQljaHVua191cChjaHVuayk7CiAJfQogCiAJYmlvX3B1dCgmY2Jpby0+Ymlv
KTsKIH0KIAotc3RydWN0IGNodW5rICpjaHVua19hbGxvYyhzdHJ1Y3QgZGlmZl9hcmVhICpk
aWZmX2FyZWEsIHVuc2lnbmVkIGxvbmcgbnVtYmVyKQotewotCXN0cnVjdCBjaHVuayAqY2h1
bms7Ci0KLQljaHVuayA9IGt6YWxsb2Moc2l6ZW9mKHN0cnVjdCBjaHVuayksIEdGUF9LRVJO
RUwpOwotCWlmICghY2h1bmspCi0JCXJldHVybiBOVUxMOwotCi0JSU5JVF9MSVNUX0hFQUQo
JmNodW5rLT5saW5rKTsKLQlzZW1hX2luaXQoJmNodW5rLT5sb2NrLCAxKTsKLQljaHVuay0+
ZGlmZl9hcmVhID0gZGlmZl9hcmVhOwotCWNodW5rLT5udW1iZXIgPSBudW1iZXI7Ci0JY2h1
bmstPnN0YXRlID0gQ0hVTktfU1RfTkVXOwotCXJldHVybiBjaHVuazsKLX0KLQotdm9pZCBj
aHVua19mcmVlKHN0cnVjdCBjaHVuayAqY2h1bmspCi17Ci0JaWYgKHVubGlrZWx5KCFjaHVu
aykpCi0JCXJldHVybjsKLQljaHVua19kaWZmX2J1ZmZlcl9yZWxlYXNlKGNodW5rKTsKLQlk
aWZmX3N0b3JhZ2VfZnJlZV9yZWdpb24oY2h1bmstPmRpZmZfcmVnaW9uKTsKLQlrZnJlZShj
aHVuayk7Ci19Ci0KIHN0YXRpYyB2b2lkIGNodW5rX2lvX2VuZGlvKHN0cnVjdCBiaW8gKmJp
bykKIHsKIAlzdHJ1Y3QgY2h1bmtfYmlvICpjYmlvID0gY29udGFpbmVyX29mKGJpbywgc3Ry
dWN0IGNodW5rX2JpbywgYmlvKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svYmxrc25h
cC9jaHVuay5oIGIvZHJpdmVycy9ibG9jay9ibGtzbmFwL2NodW5rLmgKaW5kZXggZjY4YmY0
ZjA1NzJmLi42NjFjY2EyMGI4NjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svYmxrc25h
cC9jaHVuay5oCisrKyBiL2RyaXZlcnMvYmxvY2svYmxrc25hcC9jaHVuay5oCkBAIC03LDYg
KzcsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2Jsa2Rldi5oPgogI2luY2x1ZGUgPGxpbnV4L3J3
c2VtLmg+CiAjaW5jbHVkZSA8bGludXgvYXRvbWljLmg+CisjaW5jbHVkZSAiZGlmZl9hcmVh
LmgiCiAKIHN0cnVjdCBkaWZmX2FyZWE7CiBzdHJ1Y3QgZGlmZl9yZWdpb247CkBAIC00MSw4
ICs0Miw2IEBAIGVudW0gY2h1bmtfc3QgewogICoKICAqIEBsaW5rOgogICoJVGhlIGxpc3Qg
aGVhZGVyIGFsbG93cyB0byBjcmVhdGUgcXVldWUgb2YgY2h1bmtzLgotICogQGRpZmZfYXJl
YToKLSAqCVBvaW50ZXIgdG8gdGhlIGRpZmZlcmVuY2UgYXJlYSAtIHRoZSBzdG9yYWdlIG9m
IGNoYW5nZXMgZm9yIGEgc3BlY2lmaWMgZGV2aWNlLgogICogQG51bWJlcjoKICAqCVNlcXVl
bnRpYWwgbnVtYmVyIG9mIHRoZSBjaHVuay4KICAqIEBzZWN0b3JfY291bnQ6CkBAIC01MSw2
ICs1MCwxMCBAQCBlbnVtIGNodW5rX3N0IHsKICAqIEBsb2NrOgogICoJQmluYXJ5IHNlbWFw
aG9yZS4gU3luY3MgYWNjZXNzIHRvIHRoZSBjaHVua3MgZmllbGRzOiBzdGF0ZSwKICAqCWRp
ZmZfYnVmZmVyIGFuZCBkaWZmX3JlZ2lvbi4KKyAqIEBkaWZmX2FyZWE6CisgKglQb2ludGVy
IHRvIHRoZSBkaWZmZXJlbmNlIGFyZWEgLSB0aGUgZGlmZmVyZW5jZSBzdG9yYWdlIGFyZWEg
Zm9yIGEKKyAqCXNwZWNpZmljIGRldmljZS4gVGhpcyBmaWVsZCBpcyBvbmx5IGF2YWlsYWJs
ZSB3aGVuIHRoZSBjaHVuayBpcyBsb2NrZWQuCisgKglBbGxvd3MgdG8gcHJvdGVjdCB0aGUg
ZGlmZmVyZW5jZSBhcmVhIGZyb20gZWFybHkgcmVsZWFzZS4KICAqIEBzdGF0ZToKICAqCURl
ZmluZXMgdGhlIHN0YXRlIG9mIGEgY2h1bmsuCiAgKiBAZGlmZl9idWZmZXI6CkBAIC03NCwy
MiArNzcsMjYgQEAgZW51bSBjaHVua19zdCB7CiAgKi8KIHN0cnVjdCBjaHVuayB7CiAJc3Ry
dWN0IGxpc3RfaGVhZCBsaW5rOwotCXN0cnVjdCBkaWZmX2FyZWEgKmRpZmZfYXJlYTsKLQog
CXVuc2lnbmVkIGxvbmcgbnVtYmVyOwogCXNlY3Rvcl90IHNlY3Rvcl9jb3VudDsKIAogCXN0
cnVjdCBzZW1hcGhvcmUgbG9jazsKKwlzdHJ1Y3QgZGlmZl9hcmVhICpkaWZmX2FyZWE7CiAK
IAllbnVtIGNodW5rX3N0IHN0YXRlOwogCXN0cnVjdCBkaWZmX2J1ZmZlciAqZGlmZl9idWZm
ZXI7CiAJc3RydWN0IGRpZmZfcmVnaW9uICpkaWZmX3JlZ2lvbjsKIH07CiAKLXN0cnVjdCBj
aHVuayAqY2h1bmtfYWxsb2Moc3RydWN0IGRpZmZfYXJlYSAqZGlmZl9hcmVhLCB1bnNpZ25l
ZCBsb25nIG51bWJlcik7Ci12b2lkIGNodW5rX2ZyZWUoc3RydWN0IGNodW5rICpjaHVuayk7
CitzdGF0aWMgaW5saW5lIHZvaWQgY2h1bmtfdXAoc3RydWN0IGNodW5rICpjaHVuaykKK3sK
KwlzdHJ1Y3QgZGlmZl9hcmVhICpkaWZmX2FyZWEgPSBjaHVuay0+ZGlmZl9hcmVhOworCisJ
Y2h1bmstPmRpZmZfYXJlYSA9IE5VTEw7CisJdXAoJmNodW5rLT5sb2NrKTsKKwlkaWZmX2Fy
ZWFfcHV0KGRpZmZfYXJlYSk7Cit9OwogCi12b2lkIGNodW5rX2RpZmZfYnVmZmVyX3JlbGVh
c2Uoc3RydWN0IGNodW5rICpjaHVuayk7CiB2b2lkIGNodW5rX3N0b3JlX2ZhaWxlZChzdHJ1
Y3QgY2h1bmsgKmNodW5rLCBpbnQgZXJyb3IpOwogCiB2b2lkIGNodW5rX2NvcHlfYmlvKHN0
cnVjdCBjaHVuayAqY2h1bmssIHN0cnVjdCBiaW8gKmJpbywKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvYmxvY2svYmxrc25hcC9kaWZmX2FyZWEuYyBiL2RyaXZlcnMvYmxvY2svYmxrc25hcC9k
aWZmX2FyZWEuYwppbmRleCA0YzYzODZkMGVmOGQuLjVhM2Y0ZDc0YTkyZiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ibG9jay9ibGtzbmFwL2RpZmZfYXJlYS5jCisrKyBiL2RyaXZlcnMvYmxv
Y2svYmxrc25hcC9kaWZmX2FyZWEuYwpAQCAtNyw3ICs3LDYgQEAKICNpbmNsdWRlIDxsaW51
eC9idWlsZF9idWcuaD4KICNpbmNsdWRlIDx1YXBpL2xpbnV4L2Jsa3NuYXAuaD4KICNpbmNs
dWRlICJjaHVuay5oIgotI2luY2x1ZGUgImRpZmZfYXJlYS5oIgogI2luY2x1ZGUgImRpZmZf
YnVmZmVyLmgiCiAjaW5jbHVkZSAiZGlmZl9zdG9yYWdlLmgiCiAjaW5jbHVkZSAicGFyYW1z
LmgiCkBAIC0yNSwxNCArMjQsMTQgQEAgc3RhdGljIGlubGluZSBzZWN0b3JfdCBjaHVua19z
ZWN0b3Ioc3RydWN0IGNodW5rICpjaHVuaykKIAkgICAgICAgPDwgKGNodW5rLT5kaWZmX2Fy
ZWEtPmNodW5rX3NoaWZ0IC0gU0VDVE9SX1NISUZUKTsKIH0KIAotc3RhdGljIGlubGluZSB2
b2lkIHJlY2FsY3VsYXRlX2xhc3RfY2h1bmtfc2l6ZShzdHJ1Y3QgY2h1bmsgKmNodW5rKQor
c3RhdGljIGlubGluZSBzZWN0b3JfdCBsYXN0X2NodW5rX3NpemUoc2VjdG9yX3Qgc2VjdG9y
X2NvdW50LCBzZWN0b3JfdCBjYXBhY2l0eSkKIHsKLQlzZWN0b3JfdCBjYXBhY2l0eTsKKwlz
ZWN0b3JfdCBjYXBhY2l0eV9yb3VuZGVkID0gcm91bmRfZG93bihjYXBhY2l0eSwgc2VjdG9y
X2NvdW50KTsKKworCWlmIChjYXBhY2l0eSA+IGNhcGFjaXR5X3JvdW5kZWQpCisJCXNlY3Rv
cl9jb3VudCA9IGNhcGFjaXR5IC0gY2FwYWNpdHlfcm91bmRlZDsKIAotCWNhcGFjaXR5ID0g
YmRldl9ucl9zZWN0b3JzKGNodW5rLT5kaWZmX2FyZWEtPm9yaWdfYmRldik7Ci0JaWYgKGNh
cGFjaXR5ID4gcm91bmRfZG93bihjYXBhY2l0eSwgY2h1bmstPnNlY3Rvcl9jb3VudCkpCi0J
CWNodW5rLT5zZWN0b3JfY291bnQgPQotCQkJY2FwYWNpdHkgLSByb3VuZF9kb3duKGNhcGFj
aXR5LCBjaHVuay0+c2VjdG9yX2NvdW50KTsKKwlyZXR1cm4gc2VjdG9yX2NvdW50OwogfQog
CiBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgbG9uZyBjb3VudF9ieV9zaGlmdChzZWN0
b3JfdCBjYXBhY2l0eSwKQEAgLTQzLDYgKzQyLDM1IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWdu
ZWQgbG9uZyBsb25nIGNvdW50X2J5X3NoaWZ0KHNlY3Rvcl90IGNhcGFjaXR5LAogCXJldHVy
biByb3VuZF91cChjYXBhY2l0eSwgKDF1bGwgPDwgc2hpZnRfc2VjdG9yKSkgPj4gc2hpZnRf
c2VjdG9yOwogfQogCitzdGF0aWMgaW5saW5lIHN0cnVjdCBjaHVuayAqY2h1bmtfYWxsb2Mo
dW5zaWduZWQgbG9uZyBudW1iZXIpCit7CisJc3RydWN0IGNodW5rICpjaHVuazsKKworCWNo
dW5rID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IGNodW5rKSwgR0ZQX0tFUk5FTCk7CisJaWYg
KCFjaHVuaykKKwkJcmV0dXJuIE5VTEw7CisKKwlJTklUX0xJU1RfSEVBRCgmY2h1bmstPmxp
bmspOworCXNlbWFfaW5pdCgmY2h1bmstPmxvY2ssIDEpOworCWNodW5rLT5kaWZmX2FyZWEg
PSBOVUxMOworCWNodW5rLT5udW1iZXIgPSBudW1iZXI7CisJY2h1bmstPnN0YXRlID0gQ0hV
TktfU1RfTkVXOworCXJldHVybiBjaHVuazsKK307CisKK3N0YXRpYyBpbmxpbmUgdm9pZCBj
aHVua19mcmVlKHN0cnVjdCBkaWZmX2FyZWEgKmRpZmZfYXJlYSwgc3RydWN0IGNodW5rICpj
aHVuaykKK3sKKwlpZiAodW5saWtlbHkoIWNodW5rKSkKKwkJcmV0dXJuOworCisJZG93bigm
Y2h1bmstPmxvY2spOworCWlmIChjaHVuay0+ZGlmZl9idWZmZXIpCisJCWRpZmZfYnVmZmVy
X3JlbGVhc2UoZGlmZl9hcmVhLCBjaHVuay0+ZGlmZl9idWZmZXIpOworCWRpZmZfc3RvcmFn
ZV9mcmVlX3JlZ2lvbihjaHVuay0+ZGlmZl9yZWdpb24pOworCXVwKCZjaHVuay0+bG9jayk7
CisJa2ZyZWUoY2h1bmspOworfQorCiBzdGF0aWMgdm9pZCBkaWZmX2FyZWFfY2FsY3VsYXRl
X2NodW5rX3NpemUoc3RydWN0IGRpZmZfYXJlYSAqZGlmZl9hcmVhKQogewogCXVuc2lnbmVk
IGxvbmcgbG9uZyBjb3VudDsKQEAgLTc5LDE2ICsxMDcsMTggQEAgc3RhdGljIHZvaWQgZGlm
Zl9hcmVhX2NhbGN1bGF0ZV9jaHVua19zaXplKHN0cnVjdCBkaWZmX2FyZWEgKmRpZmZfYXJl
YSkKIAkJIE1JTk9SKGRpZmZfYXJlYS0+b3JpZ19iZGV2LT5iZF9kZXYpKTsKIH0KIAotdm9p
ZCBkaWZmX2FyZWFfZnJlZShzdHJ1Y3QgZGlmZl9hcmVhICpkaWZmX2FyZWEpCit2b2lkIGRp
ZmZfYXJlYV9mcmVlKHN0cnVjdCBrcmVmICprcmVmKQogewogCXVuc2lnbmVkIGxvbmcgaW54
ID0gMDsKIAlzdHJ1Y3QgY2h1bmsgKmNodW5rOworCXN0cnVjdCBkaWZmX2FyZWEgKmRpZmZf
YXJlYSA9CisJCWNvbnRhaW5lcl9vZihrcmVmLCBzdHJ1Y3QgZGlmZl9hcmVhLCBrcmVmKTsK
IAogCW1pZ2h0X3NsZWVwKCk7CiAKIAlmbHVzaF93b3JrKCZkaWZmX2FyZWEtPnN0b3JlX3F1
ZXVlX3dvcmspOwogCXhhX2Zvcl9lYWNoKCZkaWZmX2FyZWEtPmNodW5rX21hcCwgaW54LCBj
aHVuaykKLQkJY2h1bmtfZnJlZShjaHVuayk7CisJCWNodW5rX2ZyZWUoZGlmZl9hcmVhLCBj
aHVuayk7CiAJeGFfZGVzdHJveSgmZGlmZl9hcmVhLT5jaHVua19tYXApOwogCiAJaWYgKGRp
ZmZfYXJlYS0+b3JpZ19iZGV2KSB7CkBAIC0xMTIsNiArMTQyLDcgQEAgc3RhdGljIGlubGlu
ZSBib29sIGRpZmZfYXJlYV9zdG9yZV9vbmUoc3RydWN0IGRpZmZfYXJlYSAqZGlmZl9hcmVh
KQogCQkJY2h1bmsgPSBpdGVyOwogCQkJYXRvbWljX2RlYygmZGlmZl9hcmVhLT5zdG9yZV9x
dWV1ZV9jb3VudCk7CiAJCQlsaXN0X2RlbF9pbml0KCZjaHVuay0+bGluayk7CisJCQljaHVu
ay0+ZGlmZl9hcmVhID0gZGlmZl9hcmVhX2dldChkaWZmX2FyZWEpOwogCQkJYnJlYWs7CiAJ
CX0KIAkJLyoKQEAgLTEyOSw3ICsxNjAsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgZGlmZl9h
cmVhX3N0b3JlX29uZShzdHJ1Y3QgZGlmZl9hcmVhICpkaWZmX2FyZWEpCiAJCSAqIFRoZXJl
IGNhbm5vdCBiZSBhIGNodW5rIGluIHRoZSBzdG9yZSBxdWV1ZSB3aG9zZSBidWZmZXIgaGFz
CiAJCSAqIG5vdCBiZWVuIHJlYWQgaW50byBtZW1vcnkuCiAJCSAqLwotCQl1cCgmY2h1bmst
PmxvY2spOworCQljaHVua191cChjaHVuayk7CiAJCXByX3dhcm4oIkNhbm5vdCByZWxlYXNl
IGVtcHR5IGJ1ZmZlciBmb3IgY2h1bmsgIyVsZCIsCiAJCQljaHVuay0+bnVtYmVyKTsKIAkJ
cmV0dXJuIHRydWU7CkBAIC0xOTMsNiArMjI0LDcgQEAgc3RydWN0IGRpZmZfYXJlYSAqZGlm
Zl9hcmVhX25ldyhkZXZfdCBkZXZfaWQsIHN0cnVjdCBkaWZmX3N0b3JhZ2UgKmRpZmZfc3Rv
cmFnZSkKIAkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7CiAJfQogCisJa3JlZl9pbml0KCZk
aWZmX2FyZWEtPmtyZWYpOwogCWRpZmZfYXJlYS0+b3JpZ19iZGV2ID0gYmRldjsKIAlkaWZm
X2FyZWEtPmRpZmZfc3RvcmFnZSA9IGRpZmZfc3RvcmFnZTsKIApAQCAtMjI1LDcgKzI1Nyw3
IEBAIHN0cnVjdCBkaWZmX2FyZWEgKmRpZmZfYXJlYV9uZXcoZGV2X3QgZGV2X2lkLCBzdHJ1
Y3QgZGlmZl9zdG9yYWdlICpkaWZmX3N0b3JhZ2UpCiAJICogaW5kZXBlbmRlbnRseSBvZiBl
YWNoIG90aGVyLCBwcm92aWRlZCB0aGF0IGRpZmZlcmVudCBjaHVua3MgYXJlIHVzZWQuCiAJ
ICovCiAJZm9yIChudW1iZXIgPSAwOyBudW1iZXIgPCBkaWZmX2FyZWEtPmNodW5rX2NvdW50
OyBudW1iZXIrKykgewotCQljaHVuayA9IGNodW5rX2FsbG9jKGRpZmZfYXJlYSwgbnVtYmVy
KTsKKwkJY2h1bmsgPSBjaHVua19hbGxvYyhudW1iZXIpOwogCQlpZiAoIWNodW5rKSB7CiAJ
CQlwcl9lcnIoIkZhaWxlZCBhbGxvY2F0ZSBjaHVua1xuIik7CiAJCQlyZXQgPSAtRU5PTUVN
OwpAQCAtMjM3LDcgKzI2OSw3IEBAIHN0cnVjdCBkaWZmX2FyZWEgKmRpZmZfYXJlYV9uZXco
ZGV2X3QgZGV2X2lkLCBzdHJ1Y3QgZGlmZl9zdG9yYWdlICpkaWZmX3N0b3JhZ2UpCiAJCQkJ
R0ZQX0tFUk5FTCk7CiAJCWlmIChyZXQpIHsKIAkJCXByX2VycigiRmFpbGVkIGluc2VydCBj
aHVuayB0byBjaHVuayBtYXBcbiIpOwotCQkJY2h1bmtfZnJlZShjaHVuayk7CisJCQljaHVu
a19mcmVlKGRpZmZfYXJlYSwgY2h1bmspOwogCQkJYnJlYWs7CiAJCX0KIAl9CkBAIC0yNTIs
NyArMjg0LDggQEAgc3RydWN0IGRpZmZfYXJlYSAqZGlmZl9hcmVhX25ldyhkZXZfdCBkZXZf
aWQsIHN0cnVjdCBkaWZmX3N0b3JhZ2UgKmRpZmZfc3RvcmFnZSkKIAkJcmV0dXJuIEVSUl9Q
VFIocmV0KTsKIAl9CiAKLQlyZWNhbGN1bGF0ZV9sYXN0X2NodW5rX3NpemUoY2h1bmspOwor
CWNodW5rLT5zZWN0b3JfY291bnQgPSBsYXN0X2NodW5rX3NpemUoY2h1bmstPnNlY3Rvcl9j
b3VudCwKKwkJCQkJYmRldl9ucl9zZWN0b3JzKGRpZmZfYXJlYS0+b3JpZ19iZGV2KSk7CiAK
IAlyZXR1cm4gZGlmZl9hcmVhOwogfQpAQCAtMjk4LDYgKzMzMSw3IEBAIGJvb2wgZGlmZl9h
cmVhX2NvdyhzdHJ1Y3QgYmlvICpiaW8sIHN0cnVjdCBkaWZmX2FyZWEgKmRpZmZfYXJlYSwK
IAkJCWlmICh1bmxpa2VseShyZXQpKQogCQkJCWdvdG8gZmFpbDsKIAkJfQorCQljaHVuay0+
ZGlmZl9hcmVhID0gZGlmZl9hcmVhX2dldChkaWZmX2FyZWEpOwogCiAJCWxlbiA9IGNodW5r
X2xpbWl0KGNodW5rLCBpdGVyKTsKIAkJaWYgKGNodW5rLT5zdGF0ZSA9PSBDSFVOS19TVF9O
RVcpIHsKQEAgLTMwOCw3ICszNDIsNyBAQCBib29sIGRpZmZfYXJlYV9jb3coc3RydWN0IGJp
byAqYmlvLCBzdHJ1Y3QgZGlmZl9hcmVhICpkaWZmX2FyZWEsCiAJCQkJICogaW1wb3NzaWJs
ZSB0byBwcm9jZXNzIHRoZSBJL08gd3JpdGUgdW5pdCB3aXRoCiAJCQkJICogdGhlIE5PV0FJ
VCBmbGFnLgogCQkJCSAqLwotCQkJCXVwKCZjaHVuay0+bG9jayk7CisJCQkJY2h1bmtfdXAo
Y2h1bmspOwogCQkJCXJldCA9IC1FQUdBSU47CiAJCQkJZ290byBmYWlsOwogCQkJfQpAQCAt
MzE4LDcgKzM1Miw3IEBAIGJvb2wgZGlmZl9hcmVhX2NvdyhzdHJ1Y3QgYmlvICpiaW8sIHN0
cnVjdCBkaWZmX2FyZWEgKmRpZmZfYXJlYSwKIAkJCSAqLwogCQkJcmV0ID0gY2h1bmtfbG9h
ZF9hbmRfcG9zdHBvbmVfaW8oY2h1bmssICZjaHVua19iaW8pOwogCQkJaWYgKHJldCkgewot
CQkJCXVwKCZjaHVuay0+bG9jayk7CisJCQkJY2h1bmtfdXAoY2h1bmspOwogCQkJCWdvdG8g
ZmFpbDsKIAkJCX0KIAkJCWxpc3RfYWRkX3RhaWwoJmNodW5rLT5saW5rLCAmY2h1bmtzKTsK
QEAgLTMzMCw3ICszNjQsNyBAQCBib29sIGRpZmZfYXJlYV9jb3coc3RydWN0IGJpbyAqYmlv
LCBzdHJ1Y3QgZGlmZl9hcmVhICpkaWZmX2FyZWEsCiAJCQkgKiAgIC0gc3RvcmVkIGludG8g
dGhlIGRpZmYgc3RvcmFnZQogCQkJICogSW4gdGhpcyBjYXNlLCB3ZSBkbyBub3QgY2hhbmdl
IHRoZSBjaHVuay4KIAkJCSAqLwotCQkJdXAoJmNodW5rLT5sb2NrKTsKKwkJCWNodW5rX3Vw
KGNodW5rKTsKIAkJfQogCQliaW9fYWR2YW5jZV9pdGVyX3NpbmdsZShiaW8sIGl0ZXIsIGxl
bik7CiAJfQpAQCAtMzc0LDYgKzQwOCw3IEBAIGJvb2wgZGlmZl9hcmVhX3N1Ym1pdF9jaHVu
ayhzdHJ1Y3QgZGlmZl9hcmVhICpkaWZmX2FyZWEsIHN0cnVjdCBiaW8gKmJpbykKIAogCWlm
IChkb3duX2tpbGxhYmxlKCZjaHVuay0+bG9jaykpCiAJCXJldHVybiBmYWxzZTsKKwljaHVu
ay0+ZGlmZl9hcmVhID0gZGlmZl9hcmVhX2dldChkaWZmX2FyZWEpOwogCiAJaWYgKHVubGlr
ZWx5KGNodW5rLT5zdGF0ZSA9PSBDSFVOS19TVF9GQUlMRUQpKSB7CiAJCXByX2VycigiQ2h1
bmsgIyVsZCBjb3JydXB0ZWRcbiIsIGNodW5rLT5udW1iZXIpOwpAQCAtMzgxLDcgKzQxNiw3
IEBAIGJvb2wgZGlmZl9hcmVhX3N1Ym1pdF9jaHVuayhzdHJ1Y3QgZGlmZl9hcmVhICpkaWZm
X2FyZWEsIHN0cnVjdCBiaW8gKmJpbykKIAkJCSBiaW8tPmJpX2l0ZXIuYmlfc2VjdG9yLAog
CQkJICgxVWxsIDw8IGRpZmZfYXJlYS0+Y2h1bmtfc2hpZnQpLAogCQkJIGRpZmZfYXJlYS0+
Y2h1bmtfY291bnQpOwotCQl1cCgmY2h1bmstPmxvY2spOworCQljaHVua191cChjaHVuayk7
CiAJCXJldHVybiBmYWxzZTsKIAl9CiAJaWYgKGNodW5rLT5zdGF0ZSA9PSBDSFVOS19TVF9J
Tl9NRU1PUlkpIHsKQEAgLTM5MCw3ICs0MjUsNyBAQCBib29sIGRpZmZfYXJlYV9zdWJtaXRf
Y2h1bmsoc3RydWN0IGRpZmZfYXJlYSAqZGlmZl9hcmVhLCBzdHJ1Y3QgYmlvICpiaW8pCiAJ
CSAqIGNvcHkgdG8gdGhlIGluLW1lbW9yeSBjaHVuayBmb3Igd3JpdGUgb3BlcmF0aW9uLgog
CQkgKi8KIAkJY2h1bmtfY29weV9iaW8oY2h1bmssIGJpbywgJmJpby0+YmlfaXRlcik7Ci0J
CXVwKCZjaHVuay0+bG9jayk7CisJCWNodW5rX3VwKGNodW5rKTsKIAkJcmV0dXJuIHRydWU7
CiAJfQogCWlmICgoY2h1bmstPnN0YXRlID09IENIVU5LX1NUX1NUT1JFRCkgfHwgIW9wX2lz
X3dyaXRlKGJpb19vcChiaW8pKSkgewpAQCAtMzk4LDcgKzQzMyw3IEBAIGJvb2wgZGlmZl9h
cmVhX3N1Ym1pdF9jaHVuayhzdHJ1Y3QgZGlmZl9hcmVhICpkaWZmX2FyZWEsIHN0cnVjdCBi
aW8gKmJpbykKIAkJICogUmVhZCBkYXRhIGZyb20gdGhlIGNodW5rIG9uIGRpZmZlcmVuY2Ug
c3RvcmFnZS4KIAkJICovCiAJCWNodW5rX2Nsb25lX2JpbyhjaHVuaywgYmlvKTsKLQkJdXAo
JmNodW5rLT5sb2NrKTsKKwkJY2h1bmtfdXAoY2h1bmspOwogCQlyZXR1cm4gdHJ1ZTsKIAl9
CiAJLyoKQEAgLTQwNyw3ICs0NDIsNyBAQCBib29sIGRpZmZfYXJlYV9zdWJtaXRfY2h1bmso
c3RydWN0IGRpZmZfYXJlYSAqZGlmZl9hcmVhLCBzdHJ1Y3QgYmlvICpiaW8pCiAJICogaW4t
bWVtb3J5IGNodW5rLgogCSAqLwogCWlmIChjaHVua19sb2FkX2FuZF9zY2hlZHVsZV9pbyhj
aHVuaywgYmlvKSkgewotCQl1cCgmY2h1bmstPmxvY2spOworCQljaHVua191cChjaHVuayk7
CiAJCXJldHVybiBmYWxzZTsKIAl9CiAJcmV0dXJuIHRydWU7CmRpZmYgLS1naXQgYS9kcml2
ZXJzL2Jsb2NrL2Jsa3NuYXAvZGlmZl9hcmVhLmggYi9kcml2ZXJzL2Jsb2NrL2Jsa3NuYXAv
ZGlmZl9hcmVhLmgKaW5kZXggNjFiNjA5YjY2OTkwLi5jYjNlMDk4MDljMGYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvYmxvY2svYmxrc25hcC9kaWZmX2FyZWEuaAorKysgYi9kcml2ZXJzL2Js
b2NrL2Jsa3NuYXAvZGlmZl9hcmVhLmgKQEAgLTg3LDYgKzg3LDcgQEAgc3RydWN0IGNodW5r
OwogICoKICAqLwogc3RydWN0IGRpZmZfYXJlYSB7CisJc3RydWN0IGtyZWYga3JlZjsKIAlz
dHJ1Y3QgYmxvY2tfZGV2aWNlICpvcmlnX2JkZXY7CiAJc3RydWN0IGRpZmZfc3RvcmFnZSAq
ZGlmZl9zdG9yYWdlOwogCkBAIC0xMTIsNyArMTEzLDE2IEBAIHN0cnVjdCBkaWZmX2FyZWEg
ewogCiBzdHJ1Y3QgZGlmZl9hcmVhICpkaWZmX2FyZWFfbmV3KGRldl90IGRldl9pZCwKIAkJ
CQlzdHJ1Y3QgZGlmZl9zdG9yYWdlICpkaWZmX3N0b3JhZ2UpOwotdm9pZCBkaWZmX2FyZWFf
ZnJlZShzdHJ1Y3QgZGlmZl9hcmVhICpkaWZmX2FyZWEpOwordm9pZCBkaWZmX2FyZWFfZnJl
ZShzdHJ1Y3Qga3JlZiAqa3JlZik7CitzdGF0aWMgaW5saW5lIHN0cnVjdCBkaWZmX2FyZWEg
KmRpZmZfYXJlYV9nZXQoc3RydWN0IGRpZmZfYXJlYSAqZGlmZl9hcmVhKQoreworCWtyZWZf
Z2V0KCZkaWZmX2FyZWEtPmtyZWYpOworCXJldHVybiBkaWZmX2FyZWE7Cit9Oworc3RhdGlj
IGlubGluZSB2b2lkIGRpZmZfYXJlYV9wdXQoc3RydWN0IGRpZmZfYXJlYSAqZGlmZl9hcmVh
KQoreworCWtyZWZfcHV0KCZkaWZmX2FyZWEtPmtyZWYsIGRpZmZfYXJlYV9mcmVlKTsKK307
CiAKIHZvaWQgZGlmZl9hcmVhX3NldF9jb3JydXB0ZWQoc3RydWN0IGRpZmZfYXJlYSAqZGlm
Zl9hcmVhLCBpbnQgZXJyX2NvZGUpOwogc3RhdGljIGlubGluZSBib29sIGRpZmZfYXJlYV9p
c19jb3JydXB0ZWQoc3RydWN0IGRpZmZfYXJlYSAqZGlmZl9hcmVhKQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ibG9jay9ibGtzbmFwL3NuYXBpbWFnZS5jIGIvZHJpdmVycy9ibG9jay9ibGtz
bmFwL3NuYXBpbWFnZS5jCmluZGV4IDMyOGFiYjM3Njc4MC4uNmJmZmRiOWUxYWM3IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2Jsb2NrL2Jsa3NuYXAvc25hcGltYWdlLmMKKysrIGIvZHJpdmVy
cy9ibG9jay9ibGtzbmFwL3NuYXBpbWFnZS5jCkBAIC0xMSw3ICsxMSw2IEBACiAjaW5jbHVk
ZSA8dWFwaS9saW51eC9ibGtzbmFwLmg+CiAjaW5jbHVkZSAic25hcGltYWdlLmgiCiAjaW5j
bHVkZSAidHJhY2tlci5oIgotI2luY2x1ZGUgImRpZmZfYXJlYS5oIgogI2luY2x1ZGUgImNo
dW5rLmgiCiAjaW5jbHVkZSAiY2J0X21hcC5oIgogCkBAIC0yNiw2ICsyNSwxMSBAQCBzdGF0
aWMgdm9pZCBzbmFwaW1hZ2Vfc3VibWl0X2JpbyhzdHJ1Y3QgYmlvICpiaW8pCiAJc3RydWN0
IHRyYWNrZXIgKnRyYWNrZXIgPSBiaW8tPmJpX2JkZXYtPmJkX2Rpc2stPnByaXZhdGVfZGF0
YTsKIAlzdHJ1Y3QgZGlmZl9hcmVhICpkaWZmX2FyZWEgPSB0cmFja2VyLT5kaWZmX2FyZWE7
CiAKKwkvKgorCSAqIFRoZSBkaWZmX2FyZWEgaXMgbm90IGJsb2NrZWQgZnJvbSByZWxlYXNp
bmcgbm93LCBiZWNhdXNlCisJICogc25hcGltYWdlX2ZyZWUoKSBpcyBjYWxsaW5nIGJlZm9y
ZSBkaWZmX2FyZWFfcHV0KCkgaW4KKwkgKiB0cmFja2VyX3JlbGVhc2Vfc25hcHNob3QoKS4K
KwkgKi8KIAlpZiAoZGlmZl9hcmVhX2lzX2NvcnJ1cHRlZChkaWZmX2FyZWEpKSB7CiAJCWJp
b19pb19lcnJvcihiaW8pOwogCQlyZXR1cm47CmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2Nr
L2Jsa3NuYXAvc25hcHNob3QuYyBiL2RyaXZlcnMvYmxvY2svYmxrc25hcC9zbmFwc2hvdC5j
CmluZGV4IDJmMjEwOGJiMjNiNi4uMWYyOGZmNTlkNzYyIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2Jsb2NrL2Jsa3NuYXAvc25hcHNob3QuYworKysgYi9kcml2ZXJzL2Jsb2NrL2Jsa3NuYXAv
c25hcHNob3QuYwpAQCAtMjc4LDcgKzI3OCwxNCBAQCBzdGF0aWMgaW50IHNuYXBzaG90X3Rh
a2VfdHJhY2tlcnMoc3RydWN0IHNuYXBzaG90ICpzbmFwc2hvdCkKIAkJCQlNQUpPUih0cmFj
a2VyLT5kZXZfaWQpLCBNSU5PUih0cmFja2VyLT5kZXZfaWQpKTsKIAl9CiBmYWlsOgotCisJ
aWYgKHJldCkgeworCQlsaXN0X2Zvcl9lYWNoX2VudHJ5KHRyYWNrZXIsICZzbmFwc2hvdC0+
dHJhY2tlcnMsIGxpbmspIHsKKwkJCWlmICh0cmFja2VyLT5kaWZmX2FyZWEpIHsKKwkJCQlk
aWZmX2FyZWFfcHV0KHRyYWNrZXItPmRpZmZfYXJlYSk7CisJCQkJdHJhY2tlci0+ZGlmZl9h
cmVhID0gTlVMTDsKKwkJCX0KKwkJfQorCX0KIAl1cF93cml0ZSgmc25hcHNob3QtPnJ3X2xv
Y2spOwogCXJldHVybiByZXQ7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL2Jsa3Nu
YXAvdHJhY2tlci5jIGIvZHJpdmVycy9ibG9jay9ibGtzbmFwL3RyYWNrZXIuYwppbmRleCAz
ZjY1ODZiODZmMjQuLjZkMmM3N2U0YzkwZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay9i
bGtzbmFwL3RyYWNrZXIuYworKysgYi9kcml2ZXJzL2Jsb2NrL2Jsa3NuYXAvdHJhY2tlci5j
CkBAIC00NSw4ICs0NSwxNCBAQCBzdGF0aWMgYm9vbCB0cmFja2VyX3N1Ym1pdF9iaW8oc3Ry
dWN0IGJpbyAqYmlvKQogCQljb3B5X2l0ZXIuYmlfc2VjdG9yIC09IGJpby0+YmlfYmRldi0+
YmRfc3RhcnRfc2VjdDsKIAogCWlmIChjYnRfbWFwX3NldCh0cmFja2VyLT5jYnRfbWFwLCBj
b3B5X2l0ZXIuYmlfc2VjdG9yLCBjb3VudCkgfHwKLQkgICAgIWF0b21pY19yZWFkKCZ0cmFj
a2VyLT5zbmFwc2hvdF9pc190YWtlbikgfHwKLQkgICAgZGlmZl9hcmVhX2lzX2NvcnJ1cHRl
ZCh0cmFja2VyLT5kaWZmX2FyZWEpKQorCSAgICAhYXRvbWljX3JlYWQoJnRyYWNrZXItPnNu
YXBzaG90X2lzX3Rha2VuKSkKKwkJcmV0dXJuIGZhbHNlOworCS8qCisJICogVGhlIGRpZmZf
YXJlYSBpcyBub3QgYmxvY2tlZCBmcm9tIHJlbGVhc2luZyBub3csIGJlY2F1c2UKKwkgKiBj
aGFuZ2luZyB0aGUgdmFsdWUgb2YgdGhlIHNuYXBzaG90X2lzX3Rha2VuIGlzIHBlcmZvcm1l
ZCB3aGVuCisJICogdGhlIGJsb2NrIGRldmljZSBxdWV1ZSBpcyBmcm96ZW4gaW4gdHJhY2tl
cl9yZWxlYXNlX3NuYXBzaG90KCkuCisJICovCisJaWYgKGRpZmZfYXJlYV9pc19jb3JydXB0
ZWQodHJhY2tlci0+ZGlmZl9hcmVhKSkKIAkJcmV0dXJuIGZhbHNlOwogCiAJcmV0dXJuIGRp
ZmZfYXJlYV9jb3coYmlvLCB0cmFja2VyLT5kaWZmX2FyZWEsICZjb3B5X2l0ZXIpOwpAQCAt
Mjg3LDIyICsyOTMsMjQgQEAgaW50IHRyYWNrZXJfdGFrZV9zbmFwc2hvdChzdHJ1Y3QgdHJh
Y2tlciAqdHJhY2tlcikKIAogdm9pZCB0cmFja2VyX3JlbGVhc2Vfc25hcHNob3Qoc3RydWN0
IHRyYWNrZXIgKnRyYWNrZXIpCiB7Ci0JaWYgKHRyYWNrZXItPmRpZmZfYXJlYSkgewotCQli
bGtfbXFfZnJlZXplX3F1ZXVlKHRyYWNrZXItPmRpZmZfYXJlYS0+b3JpZ19iZGV2LT5iZF9x
dWV1ZSk7Ci0KLQkJcHJfZGVidWcoIlRyYWNrZXIgZm9yIGRldmljZSBbJXU6JXVdIHJlbGVh
c2Ugc25hcHNob3RcbiIsCi0JCQkgTUFKT1IodHJhY2tlci0+ZGV2X2lkKSwgTUlOT1IodHJh
Y2tlci0+ZGV2X2lkKSk7CisJc3RydWN0IGRpZmZfYXJlYSAqZGlmZl9hcmVhID0gdHJhY2tl
ci0+ZGlmZl9hcmVhOwogCi0JCWF0b21pY19zZXQoJnRyYWNrZXItPnNuYXBzaG90X2lzX3Rh
a2VuLCBmYWxzZSk7CisJaWYgKHVubGlrZWx5KCFkaWZmX2FyZWEpKQorCQlyZXR1cm47CiAK
LQkJYmxrX21xX3VuZnJlZXplX3F1ZXVlKHRyYWNrZXItPmRpZmZfYXJlYS0+b3JpZ19iZGV2
LT5iZF9xdWV1ZSk7Ci0JfQogCXNuYXBpbWFnZV9mcmVlKHRyYWNrZXIpOwogCi0JaWYgKHRy
YWNrZXItPmRpZmZfYXJlYSkgewotCQlkaWZmX2FyZWFfZnJlZSh0cmFja2VyLT5kaWZmX2Fy
ZWEpOwotCQl0cmFja2VyLT5kaWZmX2FyZWEgPSBOVUxMOwotCX0KKwlibGtfbXFfZnJlZXpl
X3F1ZXVlKGRpZmZfYXJlYS0+b3JpZ19iZGV2LT5iZF9xdWV1ZSk7CisKKwlwcl9kZWJ1Zygi
VHJhY2tlciBmb3IgZGV2aWNlIFsldToldV0gcmVsZWFzZSBzbmFwc2hvdFxuIiwKKwkJIE1B
Sk9SKHRyYWNrZXItPmRldl9pZCksIE1JTk9SKHRyYWNrZXItPmRldl9pZCkpOworCisJYXRv
bWljX3NldCgmdHJhY2tlci0+c25hcHNob3RfaXNfdGFrZW4sIGZhbHNlKTsKKwl0cmFja2Vy
LT5kaWZmX2FyZWEgPSBOVUxMOworCisJYmxrX21xX3VuZnJlZXplX3F1ZXVlKGRpZmZfYXJl
YS0+b3JpZ19iZGV2LT5iZF9xdWV1ZSk7CisKKwlkaWZmX2FyZWFfcHV0KGRpZmZfYXJlYSk7
CiB9CiAKIGludCBfX2luaXQgdHJhY2tlcl9pbml0KHZvaWQpCg==

--------------diCWIp10pf2zmtUlXbMXuLz7--
