Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C81D455602
	for <lists+linux-doc@lfdr.de>; Thu, 18 Nov 2021 08:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244001AbhKRHs7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 18 Nov 2021 02:48:59 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:52640 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244113AbhKRHsV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Nov 2021 02:48:21 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 5760A1FD37;
        Thu, 18 Nov 2021 07:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1637221520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=U+w/6qcGp66rTr9I94Sy80m7QueLxbiRPqzDu3h7BRw=;
        b=K6OQWFI/JMK+z+tVtN4GJPi8hmjDQIfLSP6H7QfNA1UBH7Ppggfpjli9nK2FYVCdrwc27h
        ot5CIuKTJmizvos3j6MSZgivPD9Cllk1Em3wGxbWZKX+KjaV4RDtc3lBlv/UHYxc7p71BP
        rHKOJnAWy4demiEjaR1hWnu6MDqZLQk=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E1C8F13CE6;
        Thu, 18 Nov 2021 07:45:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id pDzoNY8ElmFvRAAAMHmgww
        (envelope-from <jgross@suse.com>); Thu, 18 Nov 2021 07:45:19 +0000
Subject: Re: [PATCH v3 1/4] x86/kvm: add boot parameter for adding vcpu-id
 bits
To:     Sean Christopherson <seanjc@google.com>
Cc:     kvm@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>
References: <20211116141054.17800-1-jgross@suse.com>
 <20211116141054.17800-2-jgross@suse.com>
 <7f10b8b4-e753-c977-f201-5ef17a6e81c8@suse.com> <YZWUV2jvoOS9RSq8@google.com>
From:   Juergen Gross <jgross@suse.com>
Message-ID: <731540b4-e8fc-0322-5aa0-e134bc55a397@suse.com>
Date:   Thu, 18 Nov 2021 08:45:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YZWUV2jvoOS9RSq8@google.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BJWNkMgI9hOmEloIqiq80Rjg5tRoMpM2C"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BJWNkMgI9hOmEloIqiq80Rjg5tRoMpM2C
Content-Type: multipart/mixed; boundary="ooDNn4Igq5ipKsexUzCfKaCOO8sdrL8Fi";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <731540b4-e8fc-0322-5aa0-e134bc55a397@suse.com>
Subject: Re: [PATCH v3 1/4] x86/kvm: add boot parameter for adding vcpu-id
 bits
References: <20211116141054.17800-1-jgross@suse.com>
 <20211116141054.17800-2-jgross@suse.com>
 <7f10b8b4-e753-c977-f201-5ef17a6e81c8@suse.com> <YZWUV2jvoOS9RSq8@google.com>
In-Reply-To: <YZWUV2jvoOS9RSq8@google.com>

--ooDNn4Igq5ipKsexUzCfKaCOO8sdrL8Fi
Content-Type: multipart/mixed;
 boundary="------------395CF4152ECDAA3862AEB85D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------395CF4152ECDAA3862AEB85D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18.11.21 00:46, Sean Christopherson wrote:
> On Wed, Nov 17, 2021, Juergen Gross wrote:
>> On 16.11.21 15:10, Juergen Gross wrote:
>>> Today the maximum vcpu-id of a kvm guest's vcpu on x86 systems is set=

>>> via a #define in a header file.
>>>
>>> In order to support higher vcpu-ids without generally increasing the
>>> memory consumption of guests on the host (some guest structures conta=
in
>>> arrays sized by KVM_MAX_VCPU_IDS) add a boot parameter for adding som=
e
>>> bits to the vcpu-id. Additional bits are needed as the vcpu-id is
>>> constructed via bit-wise concatenation of socket-id, core-id, etc.
>>> As those ids maximum values are not always a power of 2, the vcpu-ids=

>>> are sparse.
>>>
>>> The additional number of bits needed is basically the number of
>>> topology levels with a non-power-of-2 maximum value, excluding the to=
p
>>> most level.
>>>
>>> The default value of the new parameter will be 2 in order to support
>>> today's possible topologies. The special value of -1 will use the
>>> number of bits needed for a guest with the current host's topology.
>>>
>>> Calculating the maximum vcpu-id dynamically requires to allocate the
>>> arrays using KVM_MAX_VCPU_IDS as the size dynamically.
>>>
>>> Signed-of-by: Juergen Gross <jgross@suse.com>
>>
>> Just thought about vcpu-ids a little bit more.
>>
>> It would be possible to replace the topology games completely by an
>> arbitrary rather high vcpu-id limit (65536?) and to allocate the memor=
y
>> depending on the max vcpu-id just as needed.
>>
>> Right now the only vcpu-id dependent memory is for the ioapic consisti=
ng
>> of a vcpu-id indexed bitmap and a vcpu-id indexed byte array (vectors)=
=2E
>>
>> We could start with a minimal size when setting up an ioapic and exten=
d
>> the areas in case a new vcpu created would introduce a vcpu-id outside=

>> the currently allocated memory. Both arrays are protected by the ioapi=
c
>> specific lock (at least I couldn't spot any unprotected usage when
>> looking briefly into the code), so reallocating those arrays shouldn't=

>> be hard. In case of ENOMEM the related vcpu creation would just fail.
>>
>> Thoughts?
>=20
> Why not have userspace state the max vcpu_id it intends to creates on a=
 per-VM
> basis?  Same end result, but doesn't require the complexity of realloca=
ting the
> I/O APIC stuff.
>=20

And if the userspace doesn't do it (like today)?


Juergen

--------------395CF4152ECDAA3862AEB85D
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------395CF4152ECDAA3862AEB85D--

--ooDNn4Igq5ipKsexUzCfKaCOO8sdrL8Fi--

--BJWNkMgI9hOmEloIqiq80Rjg5tRoMpM2C
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGWBI8FAwAAAAAACgkQsN6d1ii/Ey/y
EQf+NHy8pxZtpXYQSjpBdRU7wkliC3RtcpQnu+sOcWYQdrvi+vd+MB5PTYkDBYATm0juMKAdQsMg
keEBLORRnXwyumkdOHpbdp+vZjN+XTZTIWuyr/GiEqwaKoLuZT9AFVyrmpoblbC16NPX2J59AAQZ
9OTKOQIhzL3FLJjW/kDC69Snr58DLkOCFLw6KqX1yyFsQ/1SbYS6Q4RVAEIQHdOkJkBHrFoqMHrQ
Xv6oVynHYVwv6gtlXr6kj9PaH+oMsT2UpBNn4pZanitNc9oHHl9ME9MeY6bF2oy4hxVwdsXRaus5
Fd/iUg081Jq9u6V/gfdCM6B0p/NbxwkqH2a2Ngollg==
=LjXh
-----END PGP SIGNATURE-----

--BJWNkMgI9hOmEloIqiq80Rjg5tRoMpM2C--
