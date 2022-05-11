Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0843B523237
	for <lists+linux-doc@lfdr.de>; Wed, 11 May 2022 13:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241094AbiEKLzM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 11 May 2022 07:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234225AbiEKLzK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 May 2022 07:55:10 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C4131F7E05;
        Wed, 11 May 2022 04:55:00 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 3C014219FB;
        Wed, 11 May 2022 11:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1652270099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hyuVc7tTaONALG3IogPUmPFevKbrxy/fDmDbOyIB7Kc=;
        b=S7Bx4P+p0V5lAYr5a5fyVL/XL0cQDCZS+fsyzJWiyBqkMomPeOJ1hTCuXmI36bYomZgxuJ
        cSxm4CxL2jTu1LrvWFkjV4mF6bsCsC99/vRLp6RxdiySo1sT3qE63jCoH6Lrr+txDBla3O
        2KoA5RRs3K7mllwBRYW0TIylND0tWL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1652270099;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hyuVc7tTaONALG3IogPUmPFevKbrxy/fDmDbOyIB7Kc=;
        b=NucwzjUW+4cSS9BTUuwuvhkmIC1BcYDyrSEkKDcnG+6as4brB/jfp3LlOZOS188Z3D/x7n
        EuIOnWW1WbRF7EAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B8EC13A76;
        Wed, 11 May 2022 11:54:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 8F5GAROke2L5VAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 11 May 2022 11:54:59 +0000
Message-ID: <09cc267d-ead4-dd63-07dd-dfa347cbcee1@suse.de>
Date:   Wed, 11 May 2022 13:54:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 2/7] firmware: sysfb: Add helpers to unregister a pdev
 and disable registration
Content-Language: en-US
To:     Javier Martinez Canillas <javierm@redhat.com>,
        linux-kernel@vger.kernel.org
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511112438.1251024-3-javierm@redhat.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220511112438.1251024-3-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jWYE9SUShJKR0nnBMaOhsTGn"
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jWYE9SUShJKR0nnBMaOhsTGn
Content-Type: multipart/mixed; boundary="------------RsRqHnAVd6sZkctH2yy204NG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Message-ID: <09cc267d-ead4-dd63-07dd-dfa347cbcee1@suse.de>
Subject: Re: [PATCH v5 2/7] firmware: sysfb: Add helpers to unregister a pdev
 and disable registration
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511112438.1251024-3-javierm@redhat.com>
In-Reply-To: <20220511112438.1251024-3-javierm@redhat.com>

--------------RsRqHnAVd6sZkctH2yy204NG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDUuMjIgdW0gMTM6MjQgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRoZXNlIGNhbiBiZSB1c2VkIGJ5IHN1YnN5c3RlbXMgdG8gdW5yZWdpc3Rl
ciBhIHBsYXRmb3JtIGRldmljZSByZWdpc3RlcmVkDQo+IGJ5IHN5c2ZiIGFuZCBhbHNvIHRv
IGRpc2FibGUgZnV0dXJlIHBsYXRmb3JtIGRldmljZSByZWdpc3RyYXRpb24gaW4gc3lzZmIu
DQo+DQoNCkkgZmluZCBpdCB2ZXJ5IGhhcmQgdG8gcmV2aWV3IHRoZXNlIHBhdGNoZXMsIGFz
IHJlbGF0ZWQgdGhpbmdzIGFyZSBwdXQgDQppbnRvIHNlcGFyYXRlIHBhdGNoZXMuDQoNCkkg
c3VnZ2VzdCB0byBwdXQgdGhlIHN5c2ZiX2Rpc2FibGUoKSBzdHVmZiBpbnRvIHBhdGNoIDUg
YW5kIHRoZSByZXN0IA0KaW50byBwYXRjaCA0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0K
DQoNCj4gU3VnZ2VzdGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmll
cm1AcmVkaGF0LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+DQo+IC0tLQ0KPiANCj4gKG5vIGNoYW5nZXMgc2luY2UgdjQpDQo+
IA0KPiBDaGFuZ2VzIGluIHY0Og0KPiAtIE1ha2Ugc3lzZmJfZGlzYWJsZSgpIHRvIGFsc28g
YXR0ZW1wdCB0byB1bnJlZ2lzdGVyIGEgZGV2aWNlLg0KPiANCj4gQ2hhbmdlcyBpbiB2MjoN
Cj4gLSBBZGQga2VybmVsLWRvYyBjb21tZW50cyBhbmQgaW5jbHVkZSBpbiBvdGhlcl9pbnRl
cmZhY2VzLnJzdCAoRGFuaWVsIFZldHRlcikuDQo+IA0KPiAgIC4uLi9kcml2ZXItYXBpL2Zp
cm13YXJlL290aGVyX2ludGVyZmFjZXMucnN0ICB8ICA2ICsrDQo+ICAgZHJpdmVycy9maXJt
d2FyZS9zeXNmYi5jICAgICAgICAgICAgICAgICAgICAgIHwgODcgKysrKysrKysrKysrKysr
KystLQ0KPiAgIGluY2x1ZGUvbGludXgvc3lzZmIuaCAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDE5ICsrKysNCj4gICAzIGZpbGVzIGNoYW5nZWQsIDEwNiBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZHJpdmVy
LWFwaS9maXJtd2FyZS9vdGhlcl9pbnRlcmZhY2VzLnJzdCBiL0RvY3VtZW50YXRpb24vZHJp
dmVyLWFwaS9maXJtd2FyZS9vdGhlcl9pbnRlcmZhY2VzLnJzdA0KPiBpbmRleCBiODE3OTRl
MGNmYmIuLjA2YWM4OWFkYWFmYiAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kcml2
ZXItYXBpL2Zpcm13YXJlL290aGVyX2ludGVyZmFjZXMucnN0DQo+ICsrKyBiL0RvY3VtZW50
YXRpb24vZHJpdmVyLWFwaS9maXJtd2FyZS9vdGhlcl9pbnRlcmZhY2VzLnJzdA0KPiBAQCAt
MTMsNiArMTMsMTIgQEAgRUREIEludGVyZmFjZXMNCj4gICAuLiBrZXJuZWwtZG9jOjogZHJp
dmVycy9maXJtd2FyZS9lZGQuYw0KPiAgICAgIDppbnRlcm5hbDoNCj4gICANCj4gK0dlbmVy
aWMgU3lzdGVtIEZyYW1lYnVmZmVycyBJbnRlcmZhY2UNCj4gKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gKw0KPiArLi4ga2VybmVsLWRvYzo6IGRyaXZlcnMv
ZmlybXdhcmUvc3lzZmIuYw0KPiArICAgOmV4cG9ydDoNCj4gKw0KPiAgIEludGVsIFN0cmF0
aXgxMCBTb0MgU2VydmljZSBMYXllcg0KPiAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPiAgIFNvbWUgZmVhdHVyZXMgb2YgdGhlIEludGVsIFN0cmF0aXgxMCBTb0Mg
cmVxdWlyZSBhIGxldmVsIG9mIHByaXZpbGVnZQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9m
aXJtd2FyZS9zeXNmYi5jIGIvZHJpdmVycy9maXJtd2FyZS9zeXNmYi5jDQo+IGluZGV4IGIw
MzJmNDBhOTJkZS4uNjc2ODk2ODk0OWU2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2Zpcm13
YXJlL3N5c2ZiLmMNCj4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9zeXNmYi5jDQo+IEBAIC0z
NCwyMSArMzQsOTIgQEANCj4gICAjaW5jbHVkZSA8bGludXgvc2NyZWVuX2luZm8uaD4NCj4g
ICAjaW5jbHVkZSA8bGludXgvc3lzZmIuaD4NCj4gICANCj4gK3N0YXRpYyBzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZDsNCj4gK3N0YXRpYyBERUZJTkVfTVVURVgoZGlzYWJsZV9sb2Nr
KTsNCj4gK3N0YXRpYyBib29sIGRpc2FibGVkOw0KPiArDQo+ICtzdGF0aWMgYm9vbCBzeXNm
Yl91bnJlZ2lzdGVyKHZvaWQpDQo+ICt7DQo+ICsJaWYgKElTX0VSUl9PUl9OVUxMKHBkKSkN
Cj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArDQo+ICsJcGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0
ZXIocGQpOw0KPiArCXBkID0gTlVMTDsNCj4gKw0KPiArCXJldHVybiB0cnVlOw0KPiArfQ0K
PiArDQo+ICsvKioNCj4gKyAqIHN5c2ZiX2Rpc2FibGUoKSAtIGRpc2FibGUgdGhlIEdlbmVy
aWMgU3lzdGVtIEZyYW1lYnVmZmVycyBzdXBwb3J0DQo+ICsgKg0KPiArICogVGhpcyBkaXNh
YmxlcyB0aGUgcmVnaXN0cmF0aW9uIG9mIHN5c3RlbSBmcmFtZWJ1ZmZlciBkZXZpY2VzIHRo
YXQgbWF0Y2ggdGhlDQo+ICsgKiBnZW5lcmljIGRyaXZlcnMgdGhhdCBtYWtlIHVzZSBvZiB0
aGUgc3lzdGVtIGZyYW1lYnVmZmVyIHNldCB1cCBieSBmaXJtd2FyZS4NCj4gKyAqDQo+ICsg
KiBJdCBhbHNvIHVucmVnaXN0ZXJzIGEgZGV2aWNlIGlmIHRoaXMgd2FzIGFscmVhZHkgcmVn
aXN0ZXJlZCBieSBzeXNmYl9pbml0KCkuDQo+ICsgKg0KPiArICogQ29udGV4dDogVGhlIGZ1
bmN0aW9uIGNhbiBzbGVlcC4gQSBAZGlzYWJsZV9sb2NrIG11dGV4IGlzIGFjcXVpcmVkIHRv
IHNlcmlhbGl6ZQ0KPiArICogICAgICAgICAgYWdhaW5zdCBzeXNmYl9pbml0KCksIHRoYXQg
cmVnaXN0ZXJzIGEgc3lzdGVtIGZyYW1lYnVmZmVyIGRldmljZSBhbmQNCj4gKyAqICAgICAg
ICAgIHN5c2ZiX3RyeV91bnJlZ2lzdGVyKCksIHRoYXQgdHJpZXMgdG8gdW5yZWdpc3RlciBh
IGZyYW1lYnVmZmVyIGRldmljZS4NCj4gKyAqLw0KPiArdm9pZCBzeXNmYl9kaXNhYmxlKHZv
aWQpDQo+ICt7DQo+ICsJbXV0ZXhfbG9jaygmZGlzYWJsZV9sb2NrKTsNCj4gKwlzeXNmYl91
bnJlZ2lzdGVyKCk7DQo+ICsJZGlzYWJsZWQgPSB0cnVlOw0KPiArCW11dGV4X3VubG9jaygm
ZGlzYWJsZV9sb2NrKTsNCj4gK30NCj4gK0VYUE9SVF9TWU1CT0xfR1BMKHN5c2ZiX2Rpc2Fi
bGUpOw0KPiArDQo+ICsvKioNCj4gKyAqIHN5c2ZiX3RyeV91bnJlZ2lzdGVyKCkgLSBhdHRl
bXB0IHRvIHVucmVnaXN0ZXIgYSBzeXN0ZW0gZnJhbWVidWZmZXIgZGV2aWNlDQo+ICsgKiBA
ZGV2OiBkZXZpY2UgdG8gdW5yZWdpc3Rlcg0KPiArICoNCj4gKyAqIFRoaXMgdHJpZXMgdG8g
dW5yZWdpc3RlciBhIHN5c3RlbSBmcmFtZWJ1ZmZlciBkZXZpY2UgaWYgdGhpcyB3YXMgcmVn
aXN0ZXJlZA0KPiArICogYnkgdGhlIEdlbmVyaWMgU3lzdGVtIEZyYW1lYnVmZmVycy4gVGhl
IGRldmljZSB3aWxsIG9ubHkgYmUgdW5yZWdpc3RlcmVkIGlmDQo+ICsgKiBpdCB3YXMgcmVn
aXN0ZXJlZCBieSBzeXNmYl9pbml0KCksIG90aGVyd2lzZSBpdCB3aWxsIG5vdCBiZSB1bnJl
Z2lzdGVyZWQuDQo+ICsgKg0KPiArICogQ29udGV4dDogVGhlIGZ1bmN0aW9uIGNhbiBzbGVl
cC4gYSBAbG9hZF9sb2NrIG11dGV4IGlzIGFjcXVpcmVkIHRvIHNlcmlhbGl6ZQ0KPiArICog
ICAgICAgICAgYWdhaW5zdCBzeXNmYl9pbml0KCksIHRoYXQgcmVnaXN0ZXJzIGEgc2ltcGxl
IGZyYW1lYnVmZmVyIGRldmljZSBhbmQNCj4gKyAqICAgICAgICAgIHN5c2ZiX2Rpc2FibGUo
KSwgdGhhdCBkaXNhYmxlcyB0aGUgR2VuZXJpYyBTeXN0ZW0gRnJhbWVidWZmZXJzIHN1cHBv
cnQuDQo+ICsgKg0KPiArICogUmV0dXJuOg0KPiArICogKiB0cnVlICAgICAgICAgIC0gdGhl
IGRldmljZSB3YXMgdW5yZWdpc3RlcmVkIHN1Y2Nlc3NmdWxseQ0KPiArICogKiBmYWxzZSAg
ICAgICAgIC0gdGhlIGRldmljZSB3YXMgbm90IHVucmVnaXN0ZXJlZA0KPiArICovDQo+ICti
b29sIHN5c2ZiX3RyeV91bnJlZ2lzdGVyKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gK3sNCj4g
Kwlib29sIHJldCA9IGZhbHNlOw0KPiArDQo+ICsJbXV0ZXhfbG9jaygmZGlzYWJsZV9sb2Nr
KTsNCj4gKwlpZiAoSVNfRVJSX09SX05VTEwocGQpIHx8IHBkICE9IHRvX3BsYXRmb3JtX2Rl
dmljZShkZXYpKQ0KPiArCQlnb3RvIHVubG9ja19tdXRleDsNCj4gKw0KPiArCXJldCA9IHN5
c2ZiX3VucmVnaXN0ZXIoKTsNCj4gKw0KPiArdW5sb2NrX211dGV4Og0KPiArCW11dGV4X3Vu
bG9jaygmZGlzYWJsZV9sb2NrKTsNCj4gKwlyZXR1cm4gcmV0Ow0KPiArfQ0KPiArRVhQT1JU
X1NZTUJPTF9HUEwoc3lzZmJfdHJ5X3VucmVnaXN0ZXIpOw0KPiArDQo+ICAgc3RhdGljIF9f
aW5pdCBpbnQgc3lzZmJfaW5pdCh2b2lkKQ0KPiAgIHsNCj4gICAJc3RydWN0IHNjcmVlbl9p
bmZvICpzaSA9ICZzY3JlZW5faW5mbzsNCj4gICAJc3RydWN0IHNpbXBsZWZiX3BsYXRmb3Jt
X2RhdGEgbW9kZTsNCj4gLQlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZDsNCj4gICAJY29u
c3QgY2hhciAqbmFtZTsNCj4gICAJYm9vbCBjb21wYXRpYmxlOw0KPiAtCWludCByZXQ7DQo+
ICsJaW50IHJldCA9IDA7DQo+ICsNCj4gKwltdXRleF9sb2NrKCZkaXNhYmxlX2xvY2spOw0K
PiArCWlmIChkaXNhYmxlZCkNCj4gKwkJZ290byB1bmxvY2tfbXV0ZXg7DQo+ICAgDQo+ICAg
CS8qIHRyeSB0byBjcmVhdGUgYSBzaW1wbGUtZnJhbWVidWZmZXIgZGV2aWNlICovDQo+ICAg
CWNvbXBhdGlibGUgPSBzeXNmYl9wYXJzZV9tb2RlKHNpLCAmbW9kZSk7DQo+ICAgCWlmIChj
b21wYXRpYmxlKSB7DQo+ICAgCQlwZCA9IHN5c2ZiX2NyZWF0ZV9zaW1wbGVmYihzaSwgJm1v
ZGUpOw0KPiAgIAkJaWYgKCFJU19FUlIocGQpKQ0KPiAtCQkJcmV0dXJuIDA7DQo+ICsJCQln
b3RvIHVubG9ja19tdXRleDsNCj4gICAJfQ0KPiAgIA0KPiAgIAkvKiBpZiB0aGUgRkIgaXMg
aW5jb21wYXRpYmxlLCBjcmVhdGUgYSBsZWdhY3kgZnJhbWVidWZmZXIgZGV2aWNlICovDQo+
IEBAIC02MCw4ICsxMzEsMTAgQEAgc3RhdGljIF9faW5pdCBpbnQgc3lzZmJfaW5pdCh2b2lk
KQ0KPiAgIAkJbmFtZSA9ICJwbGF0Zm9ybS1mcmFtZWJ1ZmZlciI7DQo+ICAgDQo+ICAgCXBk
ID0gcGxhdGZvcm1fZGV2aWNlX2FsbG9jKG5hbWUsIDApOw0KPiAtCWlmICghcGQpDQo+IC0J
CXJldHVybiAtRU5PTUVNOw0KPiArCWlmICghcGQpIHsNCj4gKwkJcmV0ID0gLUVOT01FTTsN
Cj4gKwkJZ290byB1bmxvY2tfbXV0ZXg7DQo+ICsJfQ0KPiAgIA0KPiAgIAlzeXNmYl9hcHBs
eV9lZmlfcXVpcmtzKHBkKTsNCj4gICANCj4gQEAgLTczLDkgKzE0NiwxMSBAQCBzdGF0aWMg
X19pbml0IGludCBzeXNmYl9pbml0KHZvaWQpDQo+ICAgCWlmIChyZXQpDQo+ICAgCQlnb3Rv
IGVycjsNCj4gICANCj4gLQlyZXR1cm4gMDsNCj4gKwlnb3RvIHVubG9ja19tdXRleDsNCj4g
ICBlcnI6DQo+ICAgCXBsYXRmb3JtX2RldmljZV9wdXQocGQpOw0KPiArdW5sb2NrX211dGV4
Og0KPiArCW11dGV4X3VubG9jaygmZGlzYWJsZV9sb2NrKTsNCj4gICAJcmV0dXJuIHJldDsN
Cj4gICB9DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3N5c2ZiLmggYi9p
bmNsdWRlL2xpbnV4L3N5c2ZiLmgNCj4gaW5kZXggNzA4MTUyZTkwMzdiLi5lOGMwMzEzZmFj
OGYgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvc3lzZmIuaA0KPiArKysgYi9pbmNs
dWRlL2xpbnV4L3N5c2ZiLmgNCj4gQEAgLTU1LDYgKzU1LDI1IEBAIHN0cnVjdCBlZmlmYl9k
bWlfaW5mbyB7DQo+ICAgCWludCBmbGFnczsNCj4gICB9Ow0KPiAgIA0KPiArI2lmZGVmIENP
TkZJR19TWVNGQg0KPiArDQo+ICt2b2lkIHN5c2ZiX2Rpc2FibGUodm9pZCk7DQo+ICtib29s
IHN5c2ZiX3RyeV91bnJlZ2lzdGVyKHN0cnVjdCBkZXZpY2UgKmRldik7DQo+ICsNCj4gKyNl
bHNlIC8qIENPTkZJR19TWVNGQiAqLw0KPiArDQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgc3lz
ZmJfZGlzYWJsZSh2b2lkKQ0KPiArew0KPiArDQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbmxp
bmUgYm9vbCBzeXNmYl90cnlfdW5yZWdpc3RlcihzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICt7
DQo+ICsJcmV0dXJuIGZhbHNlOw0KPiArfQ0KPiArDQo+ICsjZW5kaWYgLyogQ09ORklHX1NZ
U0ZCICovDQo+ICsNCj4gICAjaWZkZWYgQ09ORklHX0VGSQ0KPiAgIA0KPiAgIGV4dGVybiBz
dHJ1Y3QgZWZpZmJfZG1pX2luZm8gZWZpZmJfZG1pX2xpc3RbXTsNCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------RsRqHnAVd6sZkctH2yy204NG--

--------------jWYE9SUShJKR0nnBMaOhsTGn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJ7pBIFAwAAAAAACgkQlh/E3EQov+Ds
aA//e4JlElNaKobXLQSO2aJx7yG+oBkwdztceERT+TgV7XnF9QMwhnAWlSih1f7KbvsbO1iyPigV
xNw5Lx2pL7gVuXPgnWIvYcp3A79NTYINXYZiA+SMMZGah2DKNai8Wo77A8sEWfxLnaDG6xVglDhO
a+vkcxX5qzIWNfK+Ge07J1JLWnUKWxjYWlE3Qn/DjJxUpjnxsMHvPP0JYzkB/Ki7B8CzqZbMSzka
GMsyG5jMvQ8ZrC1EknZOce7LOEZy1sSGEgnuQUr2ZHjrZi/bPv777Z42JKJC86ZEPFRnZJYUHUo9
IIwtktzwrz0TubU0Zg9Qvf6PUEdpXeDbuSV68wd6K/e95pWL3cPB4YkKGpLB3E3tN5brJA7KXwIp
RS0LH/8PTh4PdK0gfW+coOr6ioSieF20amTKFsmVYZdNWziLM2wlpQrIi+ubLetmMWC34Hu3yFev
/vOPliR1uZYlHVWN3KNd9fhn/RirsXDpq9jsZMVufnStQ1bqBztN2/YEac6siOrW2Cr5PvxpXZMi
KRHkaHMd4XsrIISRPhHw/Y6cWPYh6akqAWfDxZ9VRwNr5EgEP/QknBrCDg8onR24YzV4KmUmlLav
qa6k46CCoXPRFwHwJ+lbuVVT7+5JI+FyDZy9s4GftIKiFfUGmlbZPhprwXIH1RnAZo6c6pJAcwcs
hIg=
=WShG
-----END PGP SIGNATURE-----

--------------jWYE9SUShJKR0nnBMaOhsTGn--
